package com.kh.spring.housing.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.spring.housing.model.service.HousingService;
import com.kh.spring.housing.model.vo.Housing;
import com.kh.spring.housing.model.vo.PageInfo;
import com.kh.spring.housing.model.vo.Pagination;
import com.kh.spring.housing.model.vo.HousingSearchCondition;
import com.kh.spring.housing.model.vo.HousingReply;
import com.kh.spring.housing.model.vo.HousingP;
import com.kh.spring.housing.model.vo.HousingPReply;




@Controller
public class HousingController {
	@Autowired
	private HousingService housingService;
	
	@RequestMapping("Toplistf.ho")
	public String housingToplist() {
		return "housing/housingTopListView";
	}
	@RequestMapping("enrollFormf.ho")
	public String housingenrollForm() {
		
		return "housing/housingEnrollForm";
	}
	@RequestMapping("enrollFormP.ho")
	public String housingPenrollForm() {
		return "housing/housingPEnrollForm";
	}
	
	
	

	@RequestMapping("list.ho")
	public String selectList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = housingService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Housing> list = housingService.selectList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "housing/housingListView";

	}
	
	@RequestMapping("blist.ho")
	public String selectPList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = housingService.selectPListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<HousingP> list = housingService.selectPList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "housing/housingPListView";

	}
	@RequestMapping("insertf.ho")
	public String inserthousing(Housing h, HttpServletRequest request, Model model, 
							  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
		
		System.out.println(h);
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				h.setOriginName(file.getOriginalFilename());
				h.setChangeName(changeName);
			}
			
		}
		int result = housingService.inserthousing(h);
		System.out.println(h);
		System.out.println(result);
		if(result >0) {
			return "redirect:list.ho";
		}else {
			System.out.println("에러");
			return "";
		}
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		System.out.println("savePath "+ savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		
		try {
			file.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
		
			System.out.println("파일 업로드 에러 "+e.getMessage());
		}
		
		
		return changeName;
	}
	
	@RequestMapping("insertP.ho")
	public String insertFhousing(HousingP hp, HttpServletRequest request, Model model, 
							  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
		
		System.out.println(hp);
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFFile(file, request);
			
			if(changeName != null) {
				hp.setHousingPOriginName(file.getOriginalFilename());
				hp.setHousingPChangeName(changeName);
			}
			
		}
		int result = housingService.insertPhousing(hp);
		System.out.println(hp);
		System.out.println(result);
		if(result >0) {
			return "redirect:blist.ho";
		}else {
			System.out.println("에러");
			return "";
		}
	}
	private String saveFFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		System.out.println("savePath "+ savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		
		try {
			file.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
		
			System.out.println("파일 업로드 에러 "+e.getMessage());
		}
		
		
		return changeName;
	}
	
	@RequestMapping("detailf.ho")
	public ModelAndView selecthousing(int hno, ModelAndView mv) {
	
		int result = housingService.updateIncreaseCount(hno);
		if(result>0) {
			Housing h = housingService.selecthousing(hno);
			System.out.println(h);
			mv.addObject("h",h).setViewName("housing/housingDetail");
		}else {
			System.out.println("상세보기 에러");
		}
		return mv;
	}
	
	@RequestMapping("detailP.ho")
	public ModelAndView selectPhousing(int hpno, ModelAndView mv) {
	
		int result = housingService.updatePIncreaseCount(hpno);
		if(result>0) {
			HousingP hp = housingService.selectPhousing(hpno);
			mv.addObject("hp",hp).setViewName("housing/housingPDetail");
		}else {
			System.out.println("상세보기 에러");
		}
		return mv;
	}
	@RequestMapping("deletef.ho")
	public String deletehousing(int hno, String fileName, HttpServletRequest request, Model model) {
		int result = housingService.deletehousing(hno);
		if(result > 0 ) {
			if(fileName.equals("")) {
				deleteFile(fileName, request);
			}
			return "redirect:list.ho";
		}else {
			System.out.println("게시물 삭제 시패");
			return "";
		}
		
		
	}
	
	@RequestMapping("deleteP.ho")
	public String deletePhousing(int hpno, String fileName, HttpServletRequest request, Model model) {
		int result = housingService.deletePhousing(hpno);
		if(result > 0 ) {
			if(fileName.equals("")) {
				deletePFile(fileName, request);
			}
			return "redirect:blist.ho";
		}else {
			System.out.println("게시물 삭제 실패");
			return "";
		}
		
		
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
	}
	
	private void deletePFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		File deleteFFile = new File(savePath+fileName);
		deleteFFile.delete();
	}
	
	@RequestMapping("updateFormf.ho")
	public ModelAndView updateFormhousing(int hno, ModelAndView mv) {
		mv.addObject("h", housingService.selecthousing(hno)).setViewName("housing/housingUpdateForm");
		return mv;
	}
	
	@RequestMapping("updateFormP.ho")
	public ModelAndView updateFormPhousing(int hpno, ModelAndView mv) {
		mv.addObject("hp", housingService.selectPhousing(hpno)).setViewName("housing/housingPUpdateForm");
		return mv;
	}
	
	@RequestMapping("updatef.ho")
	public ModelAndView updatehousing(Housing h, ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
			if(h.getChangeName() != null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				deleteFile(h.getChangeName(), request);
			}
			String changeName = saveFile(file, request); // 새로 넘어온 파일을 서버에 업로드
			h.setOriginName(file.getOriginalFilename());
			h.setChangeName(changeName);
			
			
		}
	   int result = housingService.updatehousing(h);
	   System.out.println(h);
	   System.out.println(result);
		if(result > 0) {
			mv.addObject("hno",h.getHousingNo()).setViewName("redirect:detailf.ho");
		}else {
			System.out.println("게시물 수정 실패");
		}
		return mv;
	}
	
	@RequestMapping("updateP.ho")
	public ModelAndView updatePhousing(HousingP hp, ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
			if(hp.getHousingPChangeName()!= null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				deletePFile(hp.getHousingPChangeName(), request);
			}
			String changeName = saveFile(file, request); // 새로 넘어온 파일을 서버에 업로드
			hp.setHousingPOriginName(file.getOriginalFilename());
			hp.setHousingPChangeName(changeName);
		
			
		}
	   int result = housingService.updatePhousing(hp);
	   System.out.println(hp);
	   System.out.println(result);
	
		if(result > 0) {
			mv.addObject("hpno",hp.getHousingPNo()).setViewName("redirect:detailP.ho");
		}else {
			System.out.println("게시물 수정 실패");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("rfinsert.ho")
	public String insertReply(HousingReply r) {
		int result = housingService.insertReply(r);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("rinsertP.ho")
	public String insertPReply(HousingPReply r) {
		int result = housingService.insertPReply(r);
		return String.valueOf(result);
	}
	

	@ResponseBody
	@RequestMapping(value = "rflist.ho", produces = "application/json; charset=UTF-8")
	public String selectReplyList(int hno) {
		ArrayList <HousingReply> list = housingService.selectReplyList(hno);
		
		return new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value = "rlistP.ho", produces = "application/json; charset=UTF-8")
	public String selectPReplyList(int hpno) {
		ArrayList <HousingPReply> list = housingService.selectPReplyList(hpno);
		
		return new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@RequestMapping("topListf.ho")
	public void housingTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Housing> list = housingService.selectTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	
	@RequestMapping("topListP.ho")
	public void housingPTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<HousingP> list = housingService.selectPTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	
	
	//Serach 
	@GetMapping("searchf.ho")
	public String searchList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
			 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
			
			model.addAttribute("condition",condition);
			model.addAttribute("keyword",keyword);

			HousingSearchCondition searchCondition = new HousingSearchCondition();

			if(condition.equals("title")) {
				searchCondition.setTitle(keyword);
			}else if(condition.equals("content")) {
				searchCondition.setContent(keyword);
			}else {
				searchCondition.setWriter(keyword);
			}

			int listCount = housingService.selectListCount(searchCondition);
			PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
			model.addAttribute("pageInfo",pageInfo);

			ArrayList<Housing> list = housingService.selectList(pageInfo,searchCondition);
			model.addAttribute("list",list);

			return "housing/housingListView";
	}
	
	@GetMapping("searchP.ho")
	public String searchFList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
			 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
			
			model.addAttribute("condition",condition);
			model.addAttribute("keyword",keyword);

			HousingSearchCondition searchCondition = new HousingSearchCondition();

			if(condition.equals("title")) {
				searchCondition.setTitle(keyword);
			}else if(condition.equals("content")) {
				searchCondition.setContent(keyword);
			}else {
				searchCondition.setWriter(keyword);
			}

			int listCount = housingService.selectPListCount(searchCondition);
			PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
			model.addAttribute("pageInfo",pageInfo);

			ArrayList<HousingP> list = housingService.selectPList(pageInfo,searchCondition);
			model.addAttribute("list",list);

			return "housing/housingPListView";
	}
	

	@RequestMapping("OtopListP.ho")
	public void housingOneTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Housing> list = housingService.selectOneTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}

}
