package com.kh.spring.real_estimate.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.real_estimate.model.vo.Pagination;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.exception.CommonException;
import com.kh.spring.common.upload.Upload;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.real_estimate.model.service.RealService;
import com.kh.spring.real_estimate.model.vo.PageInfo;
import com.kh.spring.real_estimate.model.vo.Real;
import com.kh.spring.real_estimate.model.vo.RealWish;

@Controller
public class RealController {

	@Autowired
	private RealService realService;
	
	@Autowired
	Upload upload;

	@RequestMapping("list.re")
	public String selectList(Model model) {
		
		try{
			int listCount = realService.selectListCount();
					
					System.out.println(listCount);
					ArrayList<Real> list = realService.selectList();
					
					System.out.println(list);
					
					//view로 게시글 리스트, 페이지 정보를 넘기기
					model.addAttribute("list",list);
					int size=list.size()+1;
					model.addAttribute("size",size);
					
					System.out.println("list 개수 : "+list.size());
					
					return "real_estimate/realListView";


			}catch(Exception e) {
						model.addAttribute("msg","Failed to load list!!");
						return "common/errorPage";
					}
	}
	
	@RequestMapping(value="houselist", method=RequestMethod.GET)
	public String houseList(
			@RequestParam(value = "search") String search, //search바에서 선택 필터 가져오기
			@RequestParam(value = "type") String type, //search바에서 선택 필터 가져오기
			@RequestParam(value = "setype") String setype, //search바에서 선택 필터 가져오기
			@RequestParam(value = "money") String money, //search바에서 선택 필터 가져오기 
			@RequestParam(value = "admin") String admin, //search바에서 선택 필터 가져오기
			Model model) {
		

		try{
			ArrayList<Real> list = realService.selectList();
					
					/*필터 조건에 맞는 매물들만 남기고 list에서 제외*/
					if(!search.equals("")) //지역명 검색 리스트 필터
						list.removeIf(r -> !r.getLocation().contains(search));
					if(!type.equals("none")) //방 타입 검색 필터
						list.removeIf(r -> !r.getStructure().equals(type));
					if(!setype.equals("none")) //세 종류 검색 필터
						list.removeIf(r -> !r.getMoney_kind().equals(setype));
					if(!money.equals("none")) {//가격대 검색 필터 (월세, 전세 구분)
						if(setype.equals("월세")) {
							if(money.equals("max")) {
								list.removeIf(r -> Integer.parseInt(r.getMoney1())<120);
							}
							else
								list.removeIf(r -> Integer.parseInt(r.getMoney1())>Integer.parseInt(money) || Integer.parseInt(money)-30>Integer.parseInt(r.getMoney1()));
						}
						else if(setype.equals("전세")) {
							if(money.equals("max")) {
								list.removeIf(r -> r.getMoney1().charAt(0)-'0'<3);
							}
							else
								list.removeIf(r -> r.getMoney1().charAt(0)-'0'>Integer.parseInt(money)-1 || r.getMoney1().charAt(0)-'0'<Integer.parseInt(money)-1);
						}
					}
					if(!admin.equals("none")) //관리비 검색 필터 (월세, 전세 구분)
						list.removeIf(r -> r.getAdmin_money()>Integer.parseInt(admin));

					
					//view로 게시글 리스트, 페이지 정보를 넘기기
					model.addAttribute("list",list);
					model.addAttribute("type",type);
					model.addAttribute("setype",setype);
					model.addAttribute("money",money);
					model.addAttribute("admin",admin);
					model.addAttribute("search",search);
					
					
					return "real_estimate/realListView";


			}catch(Exception e) {
						model.addAttribute("msg","Failed to load list!!");
						return "common/errorPage";
					}
	}
	@RequestMapping("wishform.re")
	public String wishForm(@RequestParam(name="userId")String userId,Model model) {
		
		try{
			System.out.println(userId);
					
					ArrayList<Integer> list = realService.selectWishList(userId); //stuff 리스트 가져오기
					
					ArrayList<Real> RealList=realService.selectRealList(list);
					
					model.addAttribute("list",RealList);
					
					System.out.println(list);
					System.out.println(RealList);
					
					return "real_estimate/realWishView";


			}catch(Exception e) {
						model.addAttribute("msg","Failed to load wish list!!");
						return "common/errorPage";
					}
	}
	
	@RequestMapping("wishCancle.re")
	public String wishCancle(int rno, String userId, Model model) {
		
		try{
			System.out.println(rno);
				System.out.println(userId);
				
				HashMap<String,String> mapKey = new HashMap<>();
				mapKey.put("rno",String.valueOf(rno));
				mapKey.put("userId",userId);
				
				int result = realService.deleteWish(mapKey); //stuff 리스트 가져오기
				
				ArrayList<Integer> list = realService.selectWishList(userId); //stuff 리스트 가져오기
				
				ArrayList<Real> RealList=realService.selectRealList(list); 
				
				
				model.addAttribute("list", RealList);
				model.addAttribute("message", rno+"번 매물 찜하기 취소 완료!!");
				
				
				return "real_estimate/realWishView";


		}catch(Exception e) {
					model.addAttribute("msg","Wish Cancel Failed!!");
					return "common/errorPage";
				}
	}
	
	@RequestMapping("delete.re")
	public String deleteReal(int rno, String fileName, HttpServletRequest request, Model model) {
		
		
			int result=realService.deleteReal(rno);
				
				if(result<0) {
					model.addAttribute("msg","매물 삭제에 실패하였습니다.");
					return "common/errorPage";
				}
				
				result=realService.deleteStuffWish(rno);
				
				if(result>0) {
					if(!fileName.equals("")) {
						upload.deleteFile(6,fileName, request);
						
					}
					
					return "redirect:list.re";
				}else {
					model.addAttribute("msg","Failed to delete the property!!");
					return "common/errorPage";
				}
	}
	@RequestMapping("detail.re")
	public ModelAndView selectReal(int rno, ModelAndView mv){
		
		try{
			Real real = realService.selectReal(rno);
			System.out.println(real);
				mv.addObject("r",real).setViewName("real_estimate/realDetailView");
				
				return mv;

		}catch(Exception e) {
			
			mv.addObject("msg","Failed to view the details of the property!!").setViewName("common/errorPage");
					return mv;
				}
	}
	
	@RequestMapping("enrollform.re")
	public String enrollform(){
		return "real_estimate/realEnrollForm";
	}
	
	@RequestMapping("insert.re")
	public String insertReal(Real real, HttpServletRequest request, Model model,
							  @RequestParam(name="uploadFile", required=false)MultipartFile file) {
		
		System.out.println(real);//전달되는 게시글 확인
		System.out.println("file : "+file); //전달되는 파일명 확인
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = upload.saveFile(6, false, file, request);
			//String changeName = saveFile(file,request); //업로드된 파일을 계속 활용해야 하기 때문에 따로 저장하고, changeName을 설정
			
			if(changeName!=null) { //업로드가 정상처리 되었다면 changeName에 값이 존재
				real.setOriginName(file.getOriginalFilename());
				real.setChangeName(changeName);
			}
		}
		
		int result = realService.insertReal(real);
		
		if(result>0) {
			return "redirect:list.re";
		}else {
			model.addAttribute("msg","Property registration failed!!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("wish.re")
	public ModelAndView insertWish(Model model, ModelAndView mv, @RequestParam(name="rno")int rno, @RequestParam(name="userId")String userId) throws Exception{
		try{
				RealWish realWish=new RealWish(rno,userId);
				
				Real real = realService.selectReal(rno);
				
				int result=realService.insertWish(realWish);
				
				
				if(result>0) {
					model.addAttribute("result",1);
				}else {
					model.addAttribute("result",0);
				}
				
				mv.addObject("r",real).setViewName("real_estimate/realDetailView");
				
				return mv;

		}catch(Exception e) {
			
			mv.addObject("msg","Failed to wish!!").setViewName("common/errorPage");
			
			return mv;
				}
		
	}
	
	
	
	
	@RequestMapping("updateForm.re")
	public ModelAndView updateForm(int rno, ModelAndView mv) {
		try{
			mv.addObject("r", realService.selectReal(rno))
				.setViewName("real_estimate/realUpdateForm");
				
				return mv;

		}catch(Exception e) {
			mv.addObject("msg", "Failed to load update window!!")
			.setViewName("common/errorPage");
			
			return mv;
				}
	}
	
	@RequestMapping("update.re")
	public ModelAndView updateBoard(Real r, ModelAndView mv, HttpServletRequest request, 
											@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		
			if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우
					if(r.getChangeName() != null) { //새로 넘어온 파일이 있는데 기존에 파일도 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
						upload.deleteFile(6, r.getChangeName(), request);
						//deleteFile(r.getChangeName(), request);
					}
					String changeName = upload.saveFile(6, false, file, request);
					//String changeName = saveFile(file, request); //새로 넘어온 파일을 서버에 업로드
					
					r.setOriginName(file.getOriginalFilename());
					r.setChangeName(changeName);
				}
			
				int result=realService.updateReal(r);
				
				if(result>0) {
					mv.addObject("rno", r.getStuffNo())
					.setViewName("redirect:detail.re");
				}else {
					mv.addObject("msg", "Property update failed!!")
					.setViewName("common/errorPage");
			
				}
				return mv;
	}
		


}
