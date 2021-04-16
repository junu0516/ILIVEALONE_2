package com.kh.ila.group_buy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.ila.common.exception.CommonException;
import com.kh.ila.common.paging.PageInfo;
import com.kh.ila.common.paging.Pagination;
import com.kh.ila.common.upload.Upload;
import com.kh.ila.group_buy.model.service.GroupBuyService;
import com.kh.ila.group_buy.model.vo.GroupBuyBoard;
import com.kh.ila.group_buy.model.vo.GroupBuyProduct;
import com.kh.ila.group_buy.model.vo.PurchaseHistory;
import com.kh.ila.group_buy.model.vo.SearchCondition;
import com.kh.ila.member.model.service.MemberService;
import com.kh.ila.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@PropertySource("classpath:/properties/sendSMS/smsApiKey.properties")
public class GroupBuyController {
	
	@Autowired
	private GroupBuyService groupBuyService;
	
	@Autowired
	private Upload upload;
	
	@Value("${apiKey}")
	private String apiKey;
	
	@Value("${apiSecret}")
	private String apiSecret;
	
	@RequestMapping("list.gb")
	public String showList(@RequestParam(required=false, defaultValue="1")int currentPage, Model model) {
		
		//전체 게시물 개수를 DB로부터 조회함
		int listCount = groupBuyService.selectListCount();
		
		//게시물 개수를 가지고 페이징 처리를 위한 PageInfo 객체 생성
		PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 12);
		model.addAttribute("pageInfo",pageInfo);
		
		//PageInfo 객체를 DB로 넘겨 원하는 개수(구간)의 게시물 정보를 가져옴
		ArrayList<GroupBuyBoard> list = groupBuyService.selectList(pageInfo);
		model.addAttribute("list",list);
		
		//게시물 정보에 해당하는 등록제품 정보도 DB로부터 가져와서 게시물 번호를 Key로 하는 HashMap<>으로 게시물과 매핑
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
		
		//바로 게시글 작성 페이지로 이동
		
		return "group_buy/groupBuyInsert";
	}
	
	@PostMapping("insert.gb")
	public String insertBoardAndProduct(@ModelAttribute GroupBuyBoard groupBuyBoard,
						 @ModelAttribute GroupBuyProduct groupBuyProduct,
						 @RequestParam String accountName, @RequestParam String accountBankType, @RequestParam String accountNumber,
						 HttpServletRequest request, @RequestParam(value="thumbnail", required=false)MultipartFile thumbnail) {
		
		//계좌번호 변수 초기화
		String pAccount = accountBankType+" "+accountName+" / "+accountNumber; //계좌번호 조합
		groupBuyProduct.setPAccount(pAccount); //계좌번호 정보 객체에 추가
		
		//새롭게 업데이트한 첨부파일이 있을 경우 기존의 첨부파일을 삭제한 후, 다시 업로드
		if(!thumbnail.getOriginalFilename().equals("")) {
			String gbOriginalName = thumbnail.getOriginalFilename();
			//String gbChangedName = saveFile(thumbnail,request);
			String gbChangedName = upload.saveFile(4, false, thumbnail, request);
			
			if(gbChangedName != null) {
				groupBuyBoard.setGbOriginalName(gbOriginalName);
				groupBuyBoard.setGbChangedName(gbChangedName);
			}
		}
		
		//입력받은 정보를 모두 DB로 넘겨서 새로운 게시글 정보를 등록
		int result = groupBuyService.insertBoardAndProduct(groupBuyBoard,groupBuyProduct);
		if(result>0) {
			return "redirect:list.gb";
		}else {
			throw new CommonException("게시글 등록에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("detail.gb")
	public String showDetail(@RequestParam(required=false, defaultValue="0") int gbNo, Model model,
							 @RequestParam(required=false, defaultValue="0") int pNo) {
		
		GroupBuyBoard gbBoard;
		GroupBuyProduct gbProduct;
		
		//게시글 번호 혹은 제품 번호를 입력받아, 해당하는 게시물 정보를 DB로부터 불러옴
		if(gbNo>0 && pNo<=0) {
			gbBoard = groupBuyService.selectBoard(gbNo);
			model.addAttribute("gbBoard",gbBoard);
			
			gbProduct = groupBuyService.selectProduct(gbNo);
			model.addAttribute("gbProduct",gbProduct);

		}else if(gbNo<=0 && pNo>0) {
			//System.out.println("물품번호로 검색");
			
			gbProduct = groupBuyService.selectProductWithPno(pNo);
			model.addAttribute("gbProduct",gbProduct);
		
			gbBoard = groupBuyService.selectBoard(gbProduct.getPCno());
			model.addAttribute("gbBoard",gbBoard);
			
		}
		
		// 상세조회 페이지로 이동
		return "group_buy/groupBuyDetail";
	}
	
	@GetMapping("search.gb")
	public String searchList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
							 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
		
		model.addAttribute("condition",condition); //검색어 종류(게시글 제목으로 검색한건지, 제품 이름으로 검색한거지)
		model.addAttribute("keyword",keyword); //사용자가 입력한 검색어
		
		//사용자가 입력한 검색어(keyword)와 검색어 종류(condition)을 SearchCondition 객체에 담아줌
		SearchCondition searchCondition = new SearchCondition();
		
		if(condition.equals("product")) {
			searchCondition.setProduct(keyword);
		}else {
			searchCondition.setTitle(keyword);
		}
		
		//SearchCondition 객체를 DB로 넘겨 검색결과에 해당하는 게시글의 총 개수를 조회
		int listCount = groupBuyService.selectListCount(searchCondition);
		
		//조회한 게시글 개수를 기반으로 PageInfo 객체를 동일하게 생성하여 페이징 처리
		PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		model.addAttribute("pageInfo",pageInfo);
		
		//원하는 구간만큼 게시글을 DB로 부터 불러옴
		ArrayList<GroupBuyBoard> list = groupBuyService.selectList(pageInfo,searchCondition);
		model.addAttribute("list",list);

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
		
		//수정 화면에 보여줄 게시글 정보와 제품 정보를 DB에서 불러옴
		GroupBuyBoard groupBuyBoard = groupBuyService.selectBoard(gbNo);
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProduct(gbNo);
		
		model.addAttribute("gbBoard",groupBuyBoard);
		model.addAttribute("gbProduct",groupBuyProduct);
		
		//수정화면으로 이동
		
		return "group_buy/groupBuyUpdate";
	}
	
	@PostMapping("update.gb")
	public String updateBoardAndProduct(@ModelAttribute GroupBuyBoard groupBuyBoard,
			 			 @ModelAttribute GroupBuyProduct groupBuyProduct,
			 			 HttpServletRequest request, @RequestParam(value="reuploadedThumbnail", required=false)MultipartFile thumbnail,
			 			 RedirectAttributes redirectAttr) {
		
		//새롭게 올라온 첨부파일이 존재할 경우 기존의 첨부파일을 삭제한 후 업로드
		if(!thumbnail.getOriginalFilename().equals("")) { 
			if(groupBuyBoard.getGbChangedName() != null) {
				upload.deleteFile(4, groupBuyBoard.getGbChangedName(),request);
			}
			
			String gbChangedName = upload.saveFile(4, false, thumbnail,request);
			groupBuyBoard.setGbOriginalName(thumbnail.getOriginalFilename());
			groupBuyBoard.setGbChangedName(gbChangedName);
		}
		
		//입력받은 수정 정보를 DB로 넘겨 해당 게시글과 제품의 정보를 수정
		groupBuyProduct.setPCno(groupBuyBoard.getGbNo());
		int result = groupBuyService.updateBoardAndProduct(groupBuyBoard,groupBuyProduct);
		
		if(result>0){
			redirectAttr.addFlashAttribute("message","업데이트 완료");
			return "redirect:detail.gb?gbNo="+groupBuyBoard.getGbNo();			
		}else {
			redirectAttr.addFlashAttribute("message","업데이트 실패");
			return "redirect:list.gb";
		}
	}

	@PostMapping("delete.gb")
	public String deleteBoard(@RequestParam int gbNo, HttpServletRequest request
							  ,RedirectAttributes redirectAttr) {
		
		//업로드된 이미지를 먼저 삭제
		String fileName = groupBuyService.selectBoard(gbNo).getGbChangedName();
		upload.deleteFile(4, fileName, request);
		
		//게시글 삭제
		int result = groupBuyService.deleteBoard(gbNo);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("message","게시글 삭제 완료");
			//System.out.println("삭제 완료");
			return "redirect:list.gb";
		}else {
			redirectAttr.addFlashAttribute("message","게시글 삭제 실패 \n 관리자에게 문의하세요");
			return "redirect:detail.gb?gbNo="+gbNo;
		}	
	}
	
	@GetMapping("purchaseForm.gb")
	public String showPurchaseForm(@ModelAttribute PurchaseHistory purchaseHistory, Model model, RedirectAttributes redirectAttr) {
		
		GroupBuyProduct gbProduct = groupBuyService.selectProductWithPno(purchaseHistory.getPhProduct());
		
		//현재 구매신청한 회원이 이전에 동일상품을 주문한 총 수량 조회
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phBuyer", purchaseHistory.getPhBuyer());
		mapKey.put("phProduct", String.valueOf(purchaseHistory.getPhProduct()));
		int previousPurchaseCount = groupBuyService.selectPreviousPurchaseCount(mapKey);

		
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
	public String showSalesHistory(@RequestParam(required=false, defaultValue="1")int currentPage,
								   @SessionAttribute("loginUser")Member loginUser, Model model) {
		
		//판매 건수를 DB로부터 조회한 후, 페이징 처리를 위한 PageInfo 객체를 생성하여 페이징 처리
		int historyCount = groupBuyService.selectSalesHistoryListCount(loginUser.getUserId());
		PageInfo pageInfo = Pagination.getPageInfo(historyCount, currentPage, 5,10);
		model.addAttribute("pageInfo",pageInfo);
		
		//페이징 정보를 넘겨 원하는 개수의 구매건수 데이터를 DB로부터 불러와 응답
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectSalesHistories(loginUser.getUserId(),pageInfo);
		model.addAttribute("purchaseHistories",purchaseHistories);
		
		return "group_buy/salesHistoryList";
	}
	
	@PostMapping("purchase.gb")
	public String updateDeal(@ModelAttribute PurchaseHistory purchaseHistory, 
							 String post, String address1, String address2,
							 RedirectAttributes redirectAttr, HttpSession session) throws Exception  {
		
		//넘어온 기록내역 확인
		//System.out.println(purchaseHistory);
		
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
			//System.out.println(result.toString());
			redirectAttr.addFlashAttribute("message","구매가 완료되었습니다.");
		} catch (CoolsmsException e) {
			//예외발생시 메시지 출력
			redirectAttr.addFlashAttribute("message","문자메시지 전송 실패");
			//System.out.println(e.getMessage());
			//System.out.println(e.getCode());
		}
		
		redirectAttr.addFlashAttribute("message","구매가 완료되었습니다. 문자메시지로 입금계좌를 확인하세요");
		return "redirect:list.gb";
	}
	
	@GetMapping("purchaseHistory.gb")
	public String showPurchaseHistory(@SessionAttribute("loginUser")Member loginUser, @RequestParam(required=false, defaultValue="1")int currentPage
									  ,Model model) {
		
		//세션에 존재하는 로그인된 사용자 아이디를 DB로 넘겨 기존의 구매 기록 건수를 DB로부터 조회
		int historyCount = groupBuyService.selectPurchaseHistoryListCount(loginUser.getUserId());
		
		//전달받은 기록 건수로 PageInfo 객체를 만들어 페이징 처리
		PageInfo pageInfo = Pagination.getPageInfo(historyCount, currentPage, 5, 10);
		model.addAttribute("pageInfo",pageInfo);
		
		//페이징 정보를 전달하여 DB로부터 사용자에게 보여줄 구매 기록 정보를 불러옴
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectPurchaseHistories(loginUser.getUserId(),pageInfo);
		model.addAttribute("purchaseHistories",purchaseHistories);
		//System.out.println(purchaseHistories);
		
		//구매 기록 조회 페이지로 이동
		return "group_buy/purchaseHistoryList";
	}

	@PostMapping("prepareDeal.gb")
	public String prepareDeal(int phProduct, String phBuyer, int phNo, RedirectAttributes redirectAttr) {
		
		//판매 완료 처리하기 전, 목표한 모집인원수와 구매 누적인원수가 일치하는 지를 먼저 판별
		GroupBuyProduct groupBuyProduct = groupBuyService.selectProductWithPno(phProduct);
		if(groupBuyProduct.getPPurchase()<groupBuyProduct.getPLimit()) {
			//아직 도달하지 못했을 경우 별도의 처리 없이 다시 판매 기록 조회 페이지로 재연결
			redirectAttr.addFlashAttribute("message","아직 모집인원에 도달하지 못해 마감이 불가능");
			return "redirect:salesHistory.gb";
		}
		
		//판매 완료가 가능한 경우에는, 해당 구매 기록 정보를 DB로 넘겨 판매 상태값을 W(판매중)->R(판매완료 후 배송준비)로 변경
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		mapKey.put("phNo", String.valueOf(phNo));
		
		int result = groupBuyService.updatePreparingDeal(mapKey);
		if(result>0) {
			System.out.println("배송준비처리 성공");
		}else {
			throw new CommonException("배송준비 처리 과정에서 오류가 발생했습니다. \n 관리자에게 문의해주세요");
		}
		
		redirectAttr.addFlashAttribute("message","입금이 확인되었습니다. 배송정보를 입력해주세요");
		return "redirect:salesHistory.gb";
	}
	
	@PostMapping("completeDeal.gb")
	public String completeDeal(int phNo, int phProduct, String phBuyer, String company, String invoice, RedirectAttributes redirectAttr) {
		
		//판매자가 입력한 배송정보를 등록하여 발송완료(상태값 C)로 처리한 후, 배송정보를 DB에 업데이트
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phNo",String.valueOf(phNo));
		mapKey.put("phProduct",String.valueOf(phProduct));
		mapKey.put("phBuyer",phBuyer);
		mapKey.put("phInvoice", company+" , "+invoice);
		
		int result = groupBuyService.updateCompletingDeal(mapKey);
		if(result>0) {
			redirectAttr.addFlashAttribute("message","배송정보 업데이트 완료");
		}else {
			throw new CommonException("배송준비 처리 과정에서 오류가 발생했습니다. \n 관리자에게 문의해주세요");
		}
		
		return "redirect:salesHistory.gb";
	}
	
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
		}else {
			throw new CommonException("구매 취소 처리 도중 오류가 발생했습니다. \n 관리자에게 문의하세요");
		}
		
		return "redirect:purchaseHistory.gb";
	}
	
	@GetMapping("sortSalesHistory.gb")
	public String searchList(@SessionAttribute("loginUser")Member loginUser, @RequestParam(required=false)String keyword,  
							 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
		
		//입력받은 분류기준에 따라, 분류기준과 일치하는 상태값을 가진 판매 기록만을 보여줌
		System.out.println("keyword : "+keyword);
		model.addAttribute("keyword",keyword);
		
		int historyCount = groupBuyService.selectSalesHistoryListCount(keyword,loginUser.getUserId());
		PageInfo pageInfo = Pagination.getPageInfo(historyCount, currentPage, 5, 10);
		model.addAttribute("pageInfo",pageInfo);
		
		ArrayList<PurchaseHistory> purchaseHistories = groupBuyService.selectSalesHistories(loginUser.getUserId(),keyword,pageInfo);
		System.out.println(purchaseHistories);
		model.addAttribute("purchaseHistories",purchaseHistories);
		
		return "group_buy/salesHistoryList";
	}
	
}
