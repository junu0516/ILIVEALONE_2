package com.kh.spring.used_trade.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.Pagination;
import com.kh.spring.common.upload.Upload;
import com.kh.spring.used_trade.model.service.UsedMarketService;
import com.kh.spring.used_trade.model.vo.PageInfo;
import com.kh.spring.used_trade.model.vo.UsedMarket;


@Controller
public class UsedmarketController {
	@Autowired
	private UsedMarketService usedMarketService;
	
	@Autowired
	Upload upload;
	
	//list 목록으로 이동
	@RequestMapping("list.um")
	public String selectList(@RequestParam(value="currentPage",required=false , defaultValue = "1") int currentPage , Model model) {
		
		int listCount = usedMarketService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10); //페이지제한 10 	보드제한 6
		
		ArrayList<UsedMarket> list = usedMarketService.selectList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "used_trade/usedMarketListView";
	}
	
	
	
	//list 카테고리목록으로 이동
	@ResponseBody
	@RequestMapping("listCategory.um")
	public Object selectListCategory(@RequestParam(value="currentPage",required=false , defaultValue = "1") int currentPage , Model model  ,@RequestParam String category ,@RequestParam Map<String,Object> map) {
		
		int listCount = usedMarketService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6); //페이지제한 10 	보드제한 6
		
		
		
		System.out.println("category Controller 값 전달 테스트: "+ category);
		
	
		ArrayList<UsedMarket> listC = usedMarketService.selectListCategory(pi,category);
		
		System.out.println("listC:  "+ listC);
		
		System.out.println();
		
		model.addAttribute("listC",listC);
		model.addAttribute("pi",pi);
		model.addAttribute("category",category);
		
	
		return listC; //Ajax 통신후 새로고침 새로고침 안됌!@!@
	}


	//글쓰기 폼으로 이동
	@RequestMapping("enrollForm.um")
	public String enrollForm() {
		
		return "used_trade/usedMarketEnrollForm";
	}
	
	//글쓰기 
	@RequestMapping("insert.um")
	public String insertUsedMarket(UsedMarket u, HttpServletRequest request, Model model ,
							  @RequestParam(name="uploadFile",required = false) MultipartFile file	) {
		
		System.out.println(u);
		
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = upload.saveFile(5, false, file, request);
			//String changeName = saveFile(file,request);
			
			if(changeName != null) {
				u.setOriginName(file.getOriginalFilename());
				u.setChangeName(changeName);
				
			
			}
		}
		int result = usedMarketService.insertUsedMarket(u);
		
		if(result > 0 ) {
			
			return "redirect:list.um";
	
		}else {
			//throw new CommException("게시물작성에 실패하였습니다.");
			System.out.println("게시물 작성에 실패하였습니다.");
			
			return "redirect:list.um";
		}
		
		
		}
	

	/*
	private String saveFile(MultipartFile file,HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_file\\";
		System.out.println("savePath  "+savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf(".")); //파일이름 마지막 인덱스에있는 .(확장자 기준)
		
		String changeName = currentTime + ext;
		
		
		try {
			file.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			
			System.out.println("파일 업로드 에러 "+e.getMessage());
	
		}
		
		return changeName;
	}
	*/
	
	
	@RequestMapping("detail.um")
	public ModelAndView selecctBoard(int uno,ModelAndView mv) {
		
		int result = usedMarketService.updateIncreaseCount(uno);
		
		if(result > 0) {
			UsedMarket u = usedMarketService.selectUsedMarket(uno);
			mv.addObject("u",u).setViewName("used_trade/usedMarketDetailView");
		}else {
			

		System.out.println("게시물 상세보기에 실패하였습니다.");
		
		}
		return mv;
	}
	
	
	@RequestMapping("updateForm.um")
	public ModelAndView usedMarketUpdateForm(int uno,ModelAndView mv) {
		
		mv.addObject("u",usedMarketService.selectUsedMarket(uno))
		.setViewName("used_trade/usedMarketUpdateForm");
		
		return mv;
	}
	

	@RequestMapping("update.um")
	public ModelAndView updateBoard(UsedMarket u,ModelAndView mv,HttpServletRequest request,
									@RequestParam(value="reUploadFile",required=false ) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는경우
			if(u.getChangeName() != null) {//새로넘어온 파일이 있는데 기존에 파일도  있는경우 ->서버에 업로드 되어있는 파일을 삭제
				upload.deleteFile(5, u.getChangeName(), request);
				//deleteFile(u.getChangeName(),request);
					
		}
		
		String changeName = upload.saveFile(5, false, file, request);
		//String changeName = saveFile(file,request); //새로 넘어온 파일을 서버에 업로드
		u.setOriginName(file.getOriginalFilename());
		u.setChangeName(changeName);
		}
		
		
		int result = usedMarketService.updateUsedMarket(u);
		System.out.println("controllerResult: "+result);
		System.out.println("u"+u.toString());
		
		if(result > 0) {
			mv.addObject("uno",u.getUm_No())
			.setViewName("redirect:detail.um");
		}else {
			System.out.println("게시물 수정에 실패하였습니다.");
		}
		
		
		return mv;
	
	}
	 
	/*
	private void deleteFile(String fileName, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}
	*/
	@RequestMapping("delete.um")
	public String deleteUsedMarket(int uno ,String fileName , HttpServletRequest request, Model model) {
		
		int result = usedMarketService.deleteUsedMarket(uno);
		
		if(result > 0 ) {
			if(!fileName.equals("")) {
				upload.deleteFile(5, fileName, request);
				//deleteFile(fileName,request);
			}
			return "redirect:list.um";
		}else {

				System.out.println("게시물 삭제 실패!");
				return "redirect:list.um";
		}
	}

}
