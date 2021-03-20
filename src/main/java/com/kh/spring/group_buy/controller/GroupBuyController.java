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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			 			 HttpServletRequest request, @RequestParam(value="reuploadedThumbnail", required=false)MultipartFile thumbnail,
			 			 RedirectAttributes redirectAttr) {
		
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
			redirectAttr.addFlashAttribute("message","업데이트 완료");
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
	public String deleteBoard(@RequestParam int gbNo, RedirectAttributes redirectAttr) {
		
		int result = groupBuyService.deleteBoard(gbNo);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("message","삭제 완료");
			System.out.println("삭제 완료");
			return "redirect:list.gb";
		}else {
			redirectAttr.addFlashAttribute("message","삭제 실패");
			return "redirect:detail.gb?gbNo="+gbNo;
		}
		
	}
	
	@GetMapping("purchaseForm.gb")
	public String showPurchaseForm(@ModelAttribute PurchaseHistory purchaseHistory, Model model, RedirectAttributes redirectAttr) {
		
		System.out.println(purchaseHistory);
		GroupBuyProduct gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
		System.out.println("인당 제한 수량 : "+gbProduct.getPMaxPurchase());
		
		//현재 구매신청한 회원이 이전에 동일상품을 주문한 총 수량 조회
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phBuyer", purchaseHistory.getPhBuyer());
		mapKey.put("phProduct", String.valueOf(purchaseHistory.getPhProduct()));
		int previousPurchaseCount = groupBuyService.selectPreviousPurchaseCount(mapKey);
		System.out.println("이전까지 총 주문수량 : "+previousPurchaseCount);
		
		//허용된 수량을 넘어섰을 경우에는 구매 불가 팝업과 함께 리스트로 redirect
		if(gbProduct.getPMaxPurchase()<=previousPurchaseCount) {
			String message = "허용된 구매수량을 초과하여 더 이상 구매가 불가합니다.";
			redirectAttr.addFlashAttribute("message",message);
			return "redirect:list.gb";
		}
		
		//구매 가능한 경우에는 구매폼으로 이동
		model.addAttribute("purchaseHistory",purchaseHistory);
		
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProduct(purchaseHistory.getPhProduct());
		model.addAttribute("gbProduct",groupBuyProduct);
		
		GroupBuyBoard groupBuyBoard = groupBuyService.selectBoard(purchaseHistory.getPhCno());
		model.addAttribute("gbBoard",groupBuyBoard);
		
		return "group_buy/purchaseForm";
	}
	
	@GetMapping("salesHistory.gb")
	public String showSalesHistory(@SessionAttribute("loginUser")Member loginUser, Model model) {
		
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectSalesHistories(loginUser.getUserId());
		model.addAttribute("purchaseHistories",purchaseHistories);
		
		return "group_buy/salesHistoryList";
	}
	
	@PostMapping("purchase.gb")
	public String addPurchaseHistory(@ModelAttribute PurchaseHistory purchaseHistory, 
									  String post, String address1, String address2,RedirectAttributes redirectAttr) {
		
		//넘어온 기록내역 확인
		System.out.println(purchaseHistory);
		
		//주소 업데이트
		String address = post+" "+address1+" "+address2;
		purchaseHistory.setPhAddress(address);
		System.out.println(purchaseHistory);
		
		/*
		 * 1. 이전 구매기록이 있는지 확인
		 * 2. 구매기록이 없다면, 모집인원 도달여부를 먼저 확인
		 *    -> 아직 충분하면 바로 업데이트 후, 모집인원 1명 누적
		 * 3. 구매기록이 있다면, 인당 제한된 수량에 도달했는 지를 확인
		 *    -> 제한된 수량에 도달하지 않았다면 업데이트 후 모집인원 1명 누적
		 * 
		 * */
	
		//1. 이전 구매내역이 존재하는지 확인
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phBuyer", purchaseHistory.getPhBuyer());
		mapKey.put("phProduct", String.valueOf(purchaseHistory.getPhProduct()));
		int previousPurchaseCount = groupBuyService.selectPreviousPurchaseCount(mapKey);
		
		int result = -1;
		GroupBuyProduct gbProduct;
		if(previousPurchaseCount<=0) { //이전 구매기록이 없을 경우
			//모집인원 도달여부 확인
			gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
			int limit = gbProduct.getPLimit();
			int purchaseCount = gbProduct.getPPurchase();
			System.out.println("구매처리 전  : limit -> "+limit+" / count -> "+purchaseCount);
			if(purchaseCount+1>limit) {
				redirectAttr.addFlashAttribute("message","이미 모집인원 도달로 더 이상 구매가 불가합니다.");
				return "redirect:list.gb";
			}
			
			//누적인원 1명 추가하여 업데이트 후 모집인원, 누적인원 확인
			result = groupBuyService.updatePurchase(purchaseHistory.getPhProduct());	
			gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
			limit = gbProduct.getPLimit();
			purchaseCount = gbProduct.getPPurchase();
			System.out.println("구매처리 후 : limit -> "+limit+" / count -> "+purchaseCount);
			
			result = -1;
		}else { //이전 구매기록이 존재하는 경우
			
			//인당 제한된 수량에 도달했는 지 확인 후, 여유가 없을 경우 구매처리 없이 redirect
			gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
			if(purchaseHistory.getPhQuantity()+previousPurchaseCount>gbProduct.getPMaxPurchase()) { //아직 여유가 없는 경우
				redirectAttr.addFlashAttribute("message","개인별로 허용된 구매 수량을 초과하였습니다.");
				return "redirect:detail.gb?pNo="+gbProduct.getPNo();	
			}
		}
		
		
		//업데이트 후 모집인원이 다 차면, 판매 종료 처리
		result = -1;
		int limit = gbProduct.getPLimit();
		int purchaseCount = gbProduct.getPPurchase();
		if(limit<=purchaseCount) {
			result = groupBuyService.closeDeal(purchaseHistory.getPhProduct());
			if(result>0) {
				System.out.println("제한인원 도달로 판매 종료");
			}else {
				System.out.println("제한인원 도달했지만 판매 종료 처리에 실패");
			}
		}
		
		result=-1;
		//판매종료 처리 후, 구매기록 추가
		result = groupBuyService.addPurchaseHistory(purchaseHistory);
		if(result>0) {
			System.out.println("구매내역 추가 완료");
		}
		
		redirectAttr.addFlashAttribute("message","구매가 완료되었습니다.");
	
		return "redirect:list.gb";
	}

	@GetMapping("purchaseHistory.gb")
	public String showPurchaseHistory(@SessionAttribute("loginUser")Member loginUser, Model model) {
		
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectPurchaseHistories(loginUser.getUserId());
		model.addAttribute("purchaseHistories",purchaseHistories);
		System.out.println(purchaseHistories);
		
		return "group_buy/purchaseHistoryList";
	}
	
	@GetMapping("prepareDeal.gb")
	public String prepareDeal(@RequestParam int phProduct, @RequestParam String phBuyer, RedirectAttributes redirectAttr) {
	
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProductWithPno(phProduct);
		if(groupBuyProduct.getPPurchase()<groupBuyProduct.getPLimit()) {
			redirectAttr.addFlashAttribute("message","아직 모집인원에 도달하지 못해 마감이 불가능");
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
	public String cancelDeal(@RequestParam int phNo, @RequestParam int phProduct, @RequestParam String phBuyer, RedirectAttributes redirectAttr) {
		
		System.out.println(phProduct);
		System.out.println(phBuyer);

		GroupBuyProduct groupBuyProduct = groupBuyService.selectProductWithPno(phProduct);
		if(!groupBuyProduct.getPStatus().equals("N")) {
			groupBuyService.closeDeal(groupBuyProduct.getPNo());
		}
		
		//구매내역을 status='N'으로 처리하여 취소처리
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phNo",String.valueOf(phNo));
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		
		int result = groupBuyService.cancelDeal(mapKey);
		if(result>0) {
			System.out.println("취소처리 완료");
		}
		
		//취소 후, 동일한 구매자, 제품번호로 더 이상의 구매기록이 없을 경우에는 해당 제품 테이블의 누적인원을 1명 차감
		int previousPurchaseCount = groupBuyService.selectPreviousPurchaseCount(mapKey);
		if(previousPurchaseCount<=0) {
			result=-1;
			result = groupBuyService.decreasePurchaseCount(phProduct);
			if(result>0) {
				System.out.println("count-1 처리 완료");
			}
		}
		
		//차감 후 누적인원이  제한인원보다 적어지면 판매를 다시 오픈
		result = -1;
		if(groupBuyProduct.getPPurchase()-1<groupBuyProduct.getPLimit()) {
			result = groupBuyService.reopenDeal(phProduct);
		}
		
		if(result>0) {
			redirectAttr.addFlashAttribute("message","구매취소 완료");
		}
		
		return "redirect:purchaseHistory.gb";
	}
	
	@GetMapping("test.gb")
	public String transactionTest() {
		
		System.out.println("트랜잭션 테스트");
		return "redirect:list.gb";
	}
	
}
