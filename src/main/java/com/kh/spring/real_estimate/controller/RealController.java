package com.kh.spring.real_estimate.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.real_estimate.model.vo.Pagination;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.exception.CommonException;
import com.kh.spring.real_estimate.model.service.RealService;
import com.kh.spring.real_estimate.model.vo.PageInfo;
import com.kh.spring.real_estimate.model.vo.Real;
//주석
@Controller
public class RealController {

	@Autowired
	private RealService realService;
	
	
	@RequestMapping("list.re")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, Model model) {
		
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
	}
	
	@RequestMapping(value="houselist", method=RequestMethod.GET)
	public String houseList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "setype") String setype,
			@RequestParam(value = "money") String money,
			@RequestParam(value = "admin") String admin,
			@RequestParam(value = "search") String search,
			Model model) {
		int listCount = realService.selectListCount();

		ArrayList<Real> list = realService.selectList();
		
		for(Real r:list) {
			System.out.println(r);
		}
		
		
		if(!type.equals("none"))
			list.removeIf(r -> !r.getStructure().equals(type));
		
		if(!setype.equals("none"))
			list.removeIf(r -> !r.getMoney_kind().equals(setype));
		
		if(!money.equals("none")) {
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
		
		if(!admin.equals("none"))
			list.removeIf(r -> r.getAdmin_money()>Integer.parseInt(admin));
		
		
		if(!search.equals(""))
			list.removeIf(r -> !r.getLocation().contains(search));
		
		
		//view로 게시글 리스트, 페이지 정보를 넘기기
		model.addAttribute("list",list);
		model.addAttribute("type",type);
		model.addAttribute("setype",setype);
		model.addAttribute("money",money);
		model.addAttribute("admin",admin);
		model.addAttribute("search",search);
		int size=list.size()+1;
		model.addAttribute("size",size);
		
		
		return "real_estimate/realListView";
	}
	
	@RequestMapping("detail.re")
	public ModelAndView selectReal(int rno, ModelAndView mv){

		Real real = realService.selectReal(rno);
		mv.addObject("r",real).setViewName("real_estimate/realDetailView");
		
		return mv;
	}
	
	@RequestMapping("enrollform.re")
	public String enrollform(){
		return "real_estimate/realEnrollForm";
	}
	
	@RequestMapping("insert.re")
	public String insertBoard(Real real, HttpServletRequest request, Model model,
							  @RequestParam(name="uploadFile", required=false)MultipartFile file) {
		
		System.out.println(real);//전달되는 게시글 확인
		System.out.println("file : "+file); //전달되는 파일명 확인
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file,request); //업로드된 파일을 계속 활용해야 하기 때문에 따로 저장하고, changeName을 설정
			
			if(changeName!=null) { //업로드가 정상처리 되었다면 changeName에 값이 존재
				real.setOriginName(file.getOriginalFilename());
				real.setChangeName(changeName);
			}
		}
		
		int result = realService.insertReal(real);
		if(result>0) {
			return "redirect:list.re";
		}else {
			throw new CommonException("매물 등록 실패");
		}
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("resources : "+resources);
		String savePath = resources+"\\upload_file_real\\";
		
		String originalName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //java.util로 import
		
		String ext = originalName.substring(originalName.lastIndexOf(".")); //확장자
		
		String changeName = currentTime + ext; //저장할 이름은 시간+확장자 형식으로 사용하게 될 것
		
		try {
			file.transferTo(new File(savePath+changeName)); //바뀐 이름과 경로 정보 반영해서 첨부한 파일을 transfer
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			System.out.println("파일 업로드 에러 "+e.getMessage());
		}
		
		return changeName;
	}
	
	
	@RequestMapping("delete.re")
	public String deleteBoard(int rno, String fileName, HttpServletRequest request, Model model) {
		
		int result=realService.deleteReal(rno);
		
		if(result>0) {
			if(!fileName.equals("")) {
				deleteFile(fileName, request);
			}
			
			return "redirect:list.re";
		}else {
			throw new CommonException("매물 삭제에 실패 하였습니다.");
		}
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		File deleteFile=new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
	@RequestMapping("updateForm.re")
	public ModelAndView updateForm(int rno, ModelAndView mv) {
		mv.addObject("r", realService.selectReal(rno))
		.setViewName("real_estimate/realUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("update.re")
	public ModelAndView updateBoard(Real r, ModelAndView mv, HttpServletRequest request, 
											@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우
			if(r.getChangeName() != null) { //새로 넘어온 파일이 있는데 기존에 파일도 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				deleteFile(r.getChangeName(), request);
			}
			
			String changeName = saveFile(file, request); //새로 넘어온 파일을 서버에 업로드
			
			r.setOriginName(file.getOriginalFilename());
			r.setChangeName(changeName);
			
		}
		
		
		int result=realService.updateReal(r);
		
		if(result>0) {
			mv.addObject("rno", r.getStuffNo())
			.setViewName("redirect:detail.re");
		}else {
			throw new CommonException("게시물 수정에 실패하였습니다.");
		}
		return mv;
	}


}
