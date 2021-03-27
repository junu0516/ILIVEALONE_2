package com.kh.spring.group_buy.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.spring.common.paging.PageInfo;
import com.kh.spring.common.paging.Pagination;
import com.kh.spring.group_buy.model.service.GroupBuyService;
import com.kh.spring.group_buy.model.vo.GroupBuyBoard;
import com.kh.spring.group_buy.model.vo.GroupBuyProduct;
import com.kh.spring.group_buy.model.vo.PurchaseHistory;
import com.kh.spring.group_buy.model.vo.SearchCondition;
import com.kh.spring.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	public String insertBoardAndProduct(@ModelAttribute GroupBuyBoard groupBuyBoard,
						 @ModelAttribute GroupBuyProduct groupBuyProduct,
						 @RequestParam String accountName, @RequestParam String accountBankType, @RequestParam String accountNumber,
						 HttpServletRequest request, @RequestParam(value="thumbnail", required=false)MultipartFile thumbnail) {
		
		String pAccount = accountBankType+" "+accountName+" / "+accountNumber; //계좌번호 조합
		groupBuyProduct.setPAccount(pAccount); //계좌번호 정보 객체에 추가
		
		if(!thumbnail.getOriginalFilename().equals("")) {
			String gbOriginalName = thumbnail.getOriginalFilename();
			String gbChangedName = saveFile(thumbnail,request);
			
			if(gbChangedName != null) {
				groupBuyBoard.setGbOriginalName(gbOriginalName);
				groupBuyBoard.setGbChangedName(gbChangedName);
			}
		}
		
		int result = groupBuyService.insertBoardAndProduct(groupBuyBoard,groupBuyProduct);
		if(result>0) {
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
	public String updateBoardAndProduct(@ModelAttribute GroupBuyBoard groupBuyBoard,
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
		int result = groupBuyService.updateBoardAndProduct(groupBuyBoard,groupBuyProduct);
		
		if(result>0){
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
	public String updateDeal(@ModelAttribute PurchaseHistory purchaseHistory, 
							 String post, String address1, String address2,
							 RedirectAttributes redirectAttr, HttpSession session) throws Exception  {
		
		//넘어온 기록내역 확인
		System.out.println(purchaseHistory);
		
		//주소 업데이트
		String address = post+" "+address1+" "+address2;
		purchaseHistory.setPhAddress(address);
		System.out.println(purchaseHistory);
		
		//서비스 레이어로 넘겨서 비즈니스 로직 처리
		int result = 0;
		
		result = groupBuyService.updateDeal(purchaseHistory);
		
		GroupBuyProduct gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
		switch(result) {
			case 1:
				redirectAttr.addFlashAttribute("message","이미 모집인원 도달로 더 이상 구매가 불가합니다.");
				return "redirect:list.gb";
			case 2:
				redirectAttr.addFlashAttribute("message","개인별로 허용된 구매 수량을 초과하였습니다.");
				return "redirect:detail.gb?pNo="+gbProduct.getPNo();
			case 3:
				//구매신청 완료 후, 문자메시지 전송
				//redirectAttr.addFlashAttribute("message","구매가 완료되었습니다.");
				Member loginUser = (Member)session.getAttribute("loginUser");
				redirectAttr.addFlashAttribute("to", loginUser.getPhone()); //임시 세션에 수신자 번호 담기
				redirectAttr.addFlashAttribute("account", gbProduct.getPAccount()); //임시 세션에 계좌 번호 담기
				return "redirect:sendSMS.gb";
		}
		
		//나머지 default는 오류페이지로 넘어가도록 처리(서비스레이어에서 1~3 외의 값을 반환한 경우는 오류로 간주)
		return null; //어차피 여기까지 안옴?
	}
	
	//구매신청 후, 입금확인 문자 메시지를 보내기 위한 메소드
	@GetMapping("sendSMS.gb")
	public String sendMessage(HttpServletRequest request, RedirectAttributes redirectAttr) {

		String apiKey = "NCSK5GDCGL4H6TZH";
		String apiSecret = "HY2EZEKPSCN6UMLUAT7QXFMYQ8MUXJ4B";
		Message sms = new Message(apiKey,apiSecret);
		
		HashMap<String,String> smsInfos = new HashMap<>();
		Map<String,?> redirectMap = RequestContextUtils.getInputFlashMap(request); 
		System.out.println("계좌 확인 : "+ (String)(redirectMap.get("account")));
		//(String)(redirectMap.get("to"))
		smsInfos.put("to", (String)(redirectMap.get("to"))); //수신번호
		smsInfos.put("from", "01029260516"); //발신번호
		smsInfos.put("text","입금하실 계좌정보를 확인하세요 : \n"+(String)(redirectMap.get("account"))); //문자 내용
		smsInfos.put("type", "SMS"); //문자 타입
		smsInfos.put("app_version", "test app 1.2");
		
		try {
			JSONObject result = (JSONObject)sms.send(smsInfos);
			System.out.println(result.toString());
			redirectAttr.addFlashAttribute("message","구매가 완료되었습니다.");
		} catch (CoolsmsException e) {
			//예외발생시 메시지 출력
			redirectAttr.addFlashAttribute("message","문자메시지 전송 실패");
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		redirectAttr.addFlashAttribute("message","구매가 완료되었습니다. 문자메시지로 입금계좌를 확인하세요");
		return "redirect:list.gb";
	}
	
	@GetMapping("purchaseHistory.gb")
	public String showPurchaseHistory(@SessionAttribute("loginUser")Member loginUser, Model model) {
		
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectPurchaseHistories(loginUser.getUserId());
		model.addAttribute("purchaseHistories",purchaseHistories);
		System.out.println(purchaseHistories);
		
		return "group_buy/purchaseHistoryList";
	}

	/*
	 * TODO
	 * 아래 메소드는 DB 내용을 수정하는 작업을 포함하고 있기 때문에,
	 * GET방식이 아닌 POST방식으로 변경해야 안전함
	 * 
	 * */
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
		
		int result = groupBuyService.updatePreparingDeal(mapKey);
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
		
		int result = groupBuyService.updateCompletingDeal(mapKey);
		if(result>0) {
			System.out.println("송장번호 추가 완료");
		}
		
		return "redirect:salesHistory.gb";
	}
	
	/*
	 * TODO
	 * 아래 메소드는 DB 내용을 수정하는 작업을 포함하고 있기 때문에,
	 * GET방식이 아닌 POST방식으로 변경해야 안전함
	 * 
	 * */
	@GetMapping("cancelDeal.gb")
	public String cancelDeal(@RequestParam int phNo, @RequestParam int phProduct, @RequestParam String phBuyer, RedirectAttributes redirectAttr) {
		
		//구매내역을 status='N'으로 처리하여 취소처리
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProductWithPno(phProduct);
		if(!groupBuyProduct.getPStatus().equals("N")) {
			groupBuyService.updateClosingDeal(groupBuyProduct.getPNo());
		}
		
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phNo",String.valueOf(phNo));
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		
		int result = groupBuyService.updateCancelingDeal(mapKey);

		if(result>0) {
			redirectAttr.addFlashAttribute("message","구매취소 완료");
		}
		
		return "redirect:purchaseHistory.gb";
	}
	
}
