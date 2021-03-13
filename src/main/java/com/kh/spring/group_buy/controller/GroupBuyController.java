package com.kh.spring.group_buy.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.group_buy.model.Pagination;
import com.kh.spring.group_buy.model.service.GroupBuyService;
import com.kh.spring.group_buy.model.vo.GroupBuyBoard;
import com.kh.spring.group_buy.model.vo.GroupBuyProduct;
import com.kh.spring.group_buy.model.vo.PageInfo;
import com.kh.spring.group_buy.model.vo.PurchaseHistory;
import com.kh.spring.group_buy.model.vo.SearchCondition;
import com.kh.spring.member.model.vo.Member;

@Controller
public class GroupBuyController {
	@Autowired
	GroupBuyService groupBuyService;
	
	@RequestMapping("list.gb")
	public String showList(@RequestParam(required=false, defaultValue="1")int currentPage, Model model) {
		
		int listCount = groupBuyService.selectListCount();
		PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		model.addAttribute("pageInfo",pageInfo);
		
		ArrayList<GroupBuyBoard> list = groupBuyService.selectList(pageInfo);
		model.addAttribute("list",list);
		
		HashMap<Integer,GroupBuyProduct> products = new HashMap<Integer,GroupBuyProduct>();
		ArrayList<GroupBuyProduct> productList = groupBuyService.selectProducts(pageInfo);
	
		for(GroupBuyProduct product : productList) {
			products.put(product.getPCno(), product);
		}
		
		model.addAttribute("products",products);

		return "group_buy/groupBuyList";
	}
	
	@RequestMapping("insertView.gb")
	public String showisnertView() {
		
		return "group_buy/groupBuyInsert";
	}
	
	@PostMapping("insert.gb")
	public String insert(@ModelAttribute GroupBuyBoard groupBuyBoard,
						 @ModelAttribute GroupBuyProduct groupBuyProduct,
						 HttpServletRequest request, @RequestParam(value="thumbnail", required=false)MultipartFile thumbnail) {
		
		if(!thumbnail.getOriginalFilename().equals("")) {
			String gbOriginalName = thumbnail.getOriginalFilename();
			String gbChangedName = saveFile(thumbnail,request);
			
			if(gbChangedName != null) {
				groupBuyBoard.setGbOriginalName(gbOriginalName);
				groupBuyBoard.setGbChangedName(gbChangedName);
			}
		}
		
		int result1 = groupBuyService.insertBoard(groupBuyBoard);
		int pCno = groupBuyService.getLastBoardNum();
		groupBuyProduct.setPCno(pCno);

		int result2 = groupBuyService.insertProduct(groupBuyProduct);
		
		if(result1*result2>0) {
			return "redirect:list.gb";
		}else {
			return "";
		}
	}

	private String saveFile(MultipartFile thumbnail, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		String originalName = thumbnail.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
		
		String ext = originalName.substring(originalName.lastIndexOf("."));
		String changedName = currentTime+ext;
		
		try {
			thumbnail.transferTo(new File(savePath+changedName));
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 저장 오류 : " + e.getMessage());
		}
		
		
		return changedName;
	}
	
	@GetMapping("detail.gb")
	public String showDetail(@RequestParam(required=false, defaultValue="0") int gbNo, Model model,
							 @RequestParam(required=false, defaultValue="0") int pNo) {
		
		GroupBuyBoard gbBoard;
		GroupBuyProduct gbProduct;
		
		if(gbNo>0 && pNo<=0) {
			gbBoard = groupBuyService.selectBoard(gbNo);
			model.addAttribute("gbBoard",gbBoard);
			
			gbProduct = groupBuyService.selectProduct(gbNo);
			model.addAttribute("gbProduct",gbProduct);

		}else if(gbNo<=0 && pNo>0) {
			System.out.println("물품번호로 검색");
			
			gbProduct = groupBuyService.selectProductWithPno(pNo);
			model.addAttribute("gbProduct",gbProduct);
		
			gbBoard = groupBuyService.selectBoard(gbProduct.getPCno());
			model.addAttribute("gbBoard",gbBoard);
			
		}
		
		return "group_buy/groupBuyDetail";
	}
	
	@GetMapping("search.gb")
	public String searchList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
							 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
		
		System.out.println("condition : "+condition);
		System.out.println("keyword : "+keyword);
		System.out.println("currentPage : "+currentPage);
		model.addAttribute("condition",condition);
		model.addAttribute("keyword",keyword);
		
		SearchCondition searchCondition = new SearchCondition();
		
		if(condition.equals("product")) {
			searchCondition.setProduct(keyword);
		}else {
			searchCondition.setTitle(keyword);
		}
		
		int listCount = groupBuyService.selectListCount(searchCondition);
		System.out.println("listCount : "+listCount);
		PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		model.addAttribute("pageInfo",pageInfo);
		
		ArrayList<GroupBuyBoard> list = groupBuyService.selectList(pageInfo,searchCondition);
		model.addAttribute("list",list);
		System.out.println(list);
		System.out.println(list.size());
		
		HashMap<Integer,GroupBuyProduct> products = new HashMap<Integer,GroupBuyProduct>();
		ArrayList<GroupBuyProduct> productList = groupBuyService.selectProducts(pageInfo,searchCondition);
		for(GroupBuyProduct product : productList) {
			products.put(product.getPCno(), product);
		}
		model.addAttribute("products",products);
		
		return "group_buy/groupBuyList";
	}
	
	@GetMapping("updateForm.gb")
	public String showUpdateView(@RequestParam int gbNo, Model model) {
		
		System.out.println("gbNo : "+gbNo);
		
		GroupBuyBoard groupBuyBoard = groupBuyService.selectBoard(gbNo);
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProduct(gbNo);
		
		model.addAttribute("gbBoard",groupBuyBoard);
		model.addAttribute("gbProduct",groupBuyProduct);
		
		return "group_buy/groupBuyUpdate";
	}
	
	@PostMapping("update.gb")
	public String update(@ModelAttribute GroupBuyBoard groupBuyBoard,
			 			 @ModelAttribute GroupBuyProduct groupBuyProduct,
			 			 HttpServletRequest request, @RequestParam(value="reuploadedThumbnail", required=false)MultipartFile thumbnail) {
		
		if(!thumbnail.getOriginalFilename().equals("")) { 
			if(groupBuyBoard.getGbChangedName() != null) {
				deleteFile(groupBuyBoard.getGbChangedName(),request); 
			}
			
			String gbChangedName = saveFile(thumbnail,request);
			groupBuyBoard.setGbOriginalName(thumbnail.getOriginalFilename());
			groupBuyBoard.setGbChangedName(gbChangedName);
		}
		
		groupBuyProduct.setPCno(groupBuyBoard.getGbNo());
		
		int result1 = groupBuyService.updateBoard(groupBuyBoard);
		int result2 = groupBuyService.updateProduct(groupBuyProduct);
		
		if(result1*result2>0){
			return "redirect:detail.gb?gbNo="+groupBuyBoard.getGbNo();			
		}
		
		return "redirect:list.gb";
		
	}

	private void deleteFile(String thumbnail, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		File deleteFile = new File(savePath+thumbnail);
		deleteFile.delete();
		
	}
	
	@GetMapping("delete.gb")
	public String deleteBoard(@RequestParam int gbNo) {
		
		int result = groupBuyService.deleteBoard(gbNo);
		
		if(result>0) {
			System.out.println("삭제 완료");
			return "redirect:list.gb";
		}else {
			System.out.println("삭제 실패");
			return "redirect:detail.gb?gbNo="+gbNo;
		}
		
	}
	
	@GetMapping("purchaseForm.gb")
	public String showPurchaseForm(@ModelAttribute PurchaseHistory purchaseHistory, Model model) {
		
		model.addAttribute("purchaseHistory",purchaseHistory);
		
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProduct(purchaseHistory.getPhProduct());
		model.addAttribute("gbProduct",groupBuyProduct);
		
		GroupBuyBoard groupBuyBoard = groupBuyService.selectBoard(purchaseHistory.getPhCno());
		model.addAttribute("gbBoard",groupBuyBoard);
		
		return "group_buy/purchaseForm";
	}
	
	@PostMapping("purchase.gb")
	public String addPurchaseHistory(@ModelAttribute PurchaseHistory purchaseHistory, 
									  String post, String address1, String address2) {
		
		System.out.println(purchaseHistory);
		
		String address = post+" "+address1+" "+address2;
		purchaseHistory.setPhAddress(address);
		System.out.println(purchaseHistory);
		
		//구매 처리
		GroupBuyProduct gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
		int limit = gbProduct.getPLimit();
		int purchaseCount = gbProduct.getPPurchase();
		System.out.println("구매처리 전  : limit -> "+limit+" / count -> "+purchaseCount);
		if(purchaseCount+1>limit) {
			System.out.println("제한인원 초과로 구매 불가");
			return "redirect:list.gb";
		}
			
		int result = groupBuyService.updatePurchase(purchaseHistory.getPhProduct());
		
		if(result>0) {
			System.out.println("구매내역 업데이트");
		}
		
		gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
		limit = gbProduct.getPLimit();
		purchaseCount = gbProduct.getPPurchase();
		System.out.println("구매처리 후 : limit -> "+limit+" / count -> "+purchaseCount);
		
		result = -1;
		
		if(limit<=purchaseCount) {
			result = groupBuyService.closeDeal(purchaseHistory.getPhProduct());
			if(result>0) {
				System.out.println("제한인원 도달로 판매 종료");
			}else {
				System.out.println("제한인원 도달했지만 판매 종료 처리에 실패");
			}
		}
		
		result=-1;
		//구매내역 추가
		result = groupBuyService.addPurchaseHistory(purchaseHistory);
		if(result>0) {
			System.out.println("구매내역 추가 완료");
		}

		return "redirect:list.gb";
	}
	
	@GetMapping("salesHistory.gb")
	public String showSalesHistory(@SessionAttribute("loginUser")Member loginUser, Model model) {
		
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectSalesHistories(loginUser.getUserId());
		model.addAttribute("purchaseHistories",purchaseHistories);
		
		return "group_buy/salesHistoryList";
	}
	
	@GetMapping("purchaseHistory.gb")
	public String showPurchaseHistory(@SessionAttribute("loginUser")Member loginUser, Model model) {
		
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectPurchaseHistories(loginUser.getUserId());
		model.addAttribute("purchaseHistories",purchaseHistories);
		System.out.println(purchaseHistories);
		
		return "group_buy/purchaseHistoryList";
	}
	
	@GetMapping("prepareDeal.gb")
	public String prepareDeal(@RequestParam int phProduct, @RequestParam String phBuyer) {
	
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProductWithPno(phProduct);
		if(groupBuyProduct.getPPurchase()<groupBuyProduct.getPLimit()) {
			return "redirect:salesHistory.gb";
		}
		
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		
		int result = groupBuyService.prepareDeal(mapKey);
		if(result>0) {
			System.out.println("배송준비처리 성공");
		}
		
		return "redirect:salesHistory.gb";
	}
	
	@PostMapping("completeDeal.gb")
	public String completeDeal(String phProduct, String phBuyer, String company, String invoice) {
		
		System.out.println("제품번호 : "+phProduct); //phProduct
		System.out.println("구매자 아이디 : "+phBuyer); //phBuyer
		System.out.println("배송정보 : "+company+", "+invoice);
		
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		mapKey.put("phInvoice", company+" , "+invoice);
		
		int result = groupBuyService.completeDeal(mapKey);
		if(result>0) {
			System.out.println("송장번호 추가 완료");
		}
		
		return "redirect:salesHistory.gb";
	}
	
	@GetMapping("cancelDeal.gb")
	public String cancelDeal(@RequestParam int phProduct, @RequestParam String phBuyer) {
		
		System.out.println(phProduct);
		System.out.println(phBuyer);
		
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProductWithPno(phProduct);
		if(!groupBuyProduct.getPStatus().equals("N")) {
			groupBuyService.closeDeal(groupBuyProduct.getPNo());
		}
		
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		
		int result = groupBuyService.cancelDeal(mapKey);
		if(result>0) {
			System.out.println("痍⑥냼�궡�뿭 �뾽�뜲�씠�듃 �셿猷�");
		}
		
		result=-1;
		result = groupBuyService.decreasePurchaseCount(phProduct);
		if(result>0) {
			System.out.println("援щℓ �씤�썝 媛먯냼 �셿猷�");
		}
		
		result = -1;
		if(groupBuyProduct.getPPurchase()-1<groupBuyProduct.getPLimit()) {
			result = groupBuyService.reopenDeal(phProduct);
		}
		
		return "redirect:purchaseHistory.gb";
	}
	
}
