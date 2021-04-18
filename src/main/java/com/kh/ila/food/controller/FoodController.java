package com.kh.ila.food.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ila.common.paging.PageInfo;
import com.kh.ila.common.paging.Pagination;
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
import com.kh.ila.common.upload.Upload;
import com.kh.ila.food.model.service.FoodService;
import com.kh.ila.food.model.vo.Food;
import com.kh.ila.food.model.vo.FoodP;
import com.kh.ila.food.model.vo.FoodPReply;
import com.kh.ila.food.model.vo.FoodReply;
import com.kh.ila.food.model.vo.FoodSearchCondition;


@Controller
public class FoodController {
	@Autowired
	private FoodService foodService;
	
	@Autowired
	Upload upload;
	
	@RequestMapping("Toplistf.fo")
	public String foodToplist() {
		return "food/foodTopListView";
	}
	@RequestMapping("enrollFormf.fo")
	public String foodenrollForm() {
		
		return "food/foodEnrollForm";
	}
	@RequestMapping("enrollFormP.fo")
	public String foodPenrollForm() {
		return "food/foodPEnrollForm";
	}
	
	
	

	@RequestMapping("list.fo")
	public String selectList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = foodService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Food> list = foodService.selectList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "food/foodListView";

	}
	
	@RequestMapping("blist.fo")
	public String selectPList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = foodService.selectPListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<FoodP> list = foodService.selectPList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "food/foodPListView";

	}
	@RequestMapping("insertf.fo")
	public String insertfood(Food fd, HttpServletRequest request, Model model, 
							  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
		
		System.out.println(fd);
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = upload.saveFile(2,false,file, request);
			
			if(changeName != null) {
				fd.setOriginName(file.getOriginalFilename());
				fd.setChangeName(changeName);
			}
			
		}
		int result = foodService.insertfood(fd);
		System.out.println(fd);
		System.out.println(result);
		if(result >0) {
			return "redirect:list.fo";
		}else {
			System.out.println("에러");
			return "";
		}
	}
	
	
	@RequestMapping("insertP.fo")
	public String insertFfood(FoodP fdp, HttpServletRequest request, Model model, 
							  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
		
		System.out.println(fdp);
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = upload.saveFile(8, false,file, request);
			
			if(changeName != null) {
				fdp.setFoodPOriginName(file.getOriginalFilename());
				fdp.setFoodPChangeName(changeName);
			}
			
		}
		int result = foodService.insertPfood(fdp);
		System.out.println(fdp);
		System.out.println(result);
		if(result >0) {
			return "redirect:blist.fo";
		}else {
			System.out.println("에러");
			return "";
		}
	}
	@RequestMapping("detailf.fo")
	public ModelAndView selectfood(int fdno, ModelAndView mv) {
	
		int result = foodService.updateIncreaseCount(fdno);
		if(result>0) {
			Food fd = foodService.selectfood(fdno);
			System.out.println(fd);
			mv.addObject("fd",fd).setViewName("food/foodDetail");
		}else {
			System.out.println("상세보기 에러");
		}
		return mv;
	}
	
	@RequestMapping("detailP.fo")
	public ModelAndView selectPfood(int fdpno, ModelAndView mv) {
	
		int result = foodService.updatePIncreaseCount(fdpno);
		if(result>0) {
			FoodP fdp = foodService.selectPfood(fdpno);
			mv.addObject("fdp",fdp).setViewName("food/foodPDetail");
		}else {
			System.out.println("상세보기 에러");
		}
		return mv;
	}
	@RequestMapping("deletef.fo")
	public String deletefood(int fdno, String fileName, HttpServletRequest request, Model model) {
		int result = foodService.deletefood(fdno);
		if(result > 0 ) {
			if(fileName.equals("")) {
				upload.deleteFile(2,fileName, request);
			}
			return "redirect:list.fo";
		}else {
			System.out.println("게시물 삭제 시패");
			return "";
		}
		
		
	}
	
	@RequestMapping("deleteP.fo")
	public String deletePfood(int fdpno, String fileName, HttpServletRequest request, Model model) {
		int result = foodService.deletePfood(fdpno);
		if(result > 0 ) {
			if(fileName.equals("")) {
				upload.deleteFile(8,fileName, request);
			}
			return "redirect:blist.fo";
		}else {
			System.out.println("게시물 삭제 실패");
			return "";
		}
		
		
	}
	
	@RequestMapping("updateFormf.fo")
	public ModelAndView updateFormfood(int fdno, ModelAndView mv) {
		mv.addObject("fd", foodService.selectfood(fdno)).setViewName("food/foodUpdateForm");
		return mv;
	}
	
	@RequestMapping("updateFormP.fo")
	public ModelAndView updateFormPfood(int fdpno, ModelAndView mv) {
		mv.addObject("fdp", foodService.selectPfood(fdpno)).setViewName("food/foodPUpdateForm");
		return mv;
	}
	
	@RequestMapping("updatef.fo")
	public ModelAndView updatefood(Food fd, ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
			if(fd.getChangeName() != null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				upload.deleteFile(2,fd.getChangeName(), request);
			}
			String changeName = upload.saveFile(2,false,file, request); // 새로 넘어온 파일을 서버에 업로드
			fd.setOriginName(file.getOriginalFilename());
			fd.setChangeName(changeName);
			
			
		}
	   int result = foodService.updatefood(fd);
	   System.out.println(fd);
	   System.out.println(result);
		if(result > 0) {
			mv.addObject("fdno",fd.getFoodNo()).setViewName("redirect:detailf.fo");
		}else {
			System.out.println("게시물 수정 실패");
		}
		return mv;
	}
	
	@RequestMapping("updateP.fo")
	public ModelAndView updatePfood(FoodP fdp, ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
			if(fdp.getFoodPChangeName()!= null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				upload.deleteFile(8,fdp.getFoodPChangeName(), request);
			}
			String changeName = upload.saveFile(8,false,file, request); // 새로 넘어온 파일을 서버에 업로드
			fdp.setFoodPOriginName(file.getOriginalFilename());
			fdp.setFoodPChangeName(changeName);
			
			
		}
	   int result = foodService.updatePfood(fdp);
	   System.out.println(fdp);
	   System.out.println(result);
	
		if(result > 0) {
			mv.addObject("fdpno",fdp.getFoodPNo()).setViewName("redirect:detailP.fo");
		}else {
			System.out.println("게시물 수정 실패");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("rfinsert.fo")
	public String insertReply(FoodReply r) {
		int result = foodService.insertReply(r);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("rinsertP.fo")
	public String insertPReply(FoodPReply r) {
		int result = foodService.insertPReply(r);
		return String.valueOf(result);
	}
	

	@ResponseBody
	@RequestMapping(value = "rflist.fo", produces = "application/json; charset=UTF-8")
	public String selectReplyList(int fdno) {
		ArrayList <FoodReply> list = foodService.selectReplyList(fdno);
		
		return new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value = "rlistP.fo", produces = "application/json; charset=UTF-8")
	public String selectPReplyList(int fdpno) {
		ArrayList <FoodPReply> list = foodService.selectPReplyList(fdpno);
		
		return new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@RequestMapping("topListf.fo")
	public void foodTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Food> list = foodService.selectTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	
	@RequestMapping("topListP.fo")
	public void foodPTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<FoodP> list = foodService.selectPTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	
	
	//Serach 
	@GetMapping("searchf.fo")
	public String searchList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
			 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
			
			model.addAttribute("condition",condition);
			model.addAttribute("keyword",keyword);

			FoodSearchCondition searchCondition = new FoodSearchCondition();

			if(condition.equals("title")) {
				searchCondition.setTitle(keyword);
			}else if(condition.equals("content")) {
				searchCondition.setContent(keyword);
			}else {
				searchCondition.setWriter(keyword);
			}

			int listCount = foodService.selectListCount(searchCondition);
			PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
			model.addAttribute("pageInfo",pageInfo);

			ArrayList<Food> list = foodService.selectList(pageInfo,searchCondition);
			model.addAttribute("list",list);

			return "food/foodListView";
	}
	
	@GetMapping("searchP.fo")
	public String searchFList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
			 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
			
			model.addAttribute("condition",condition);
			model.addAttribute("keyword",keyword);

			FoodSearchCondition searchCondition = new FoodSearchCondition();

			if(condition.equals("title")) {
				searchCondition.setTitle(keyword);
			}else if(condition.equals("content")) {
				searchCondition.setContent(keyword);
			}else {
				searchCondition.setWriter(keyword);
			}

			int listCount = foodService.selectPListCount(searchCondition);
			PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
			model.addAttribute("pageInfo",pageInfo);

			ArrayList<FoodP> list = foodService.selectPList(pageInfo,searchCondition);
			model.addAttribute("list",list);

			return "food/foodPListView";
	}
	
	//1위 게시글 
	@RequestMapping("OtopListP.fo")
	public void foodOneTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Food> list = foodService.selectOneTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	


}
