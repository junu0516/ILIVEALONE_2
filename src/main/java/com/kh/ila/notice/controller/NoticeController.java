package com.kh.ila.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ila.common.upload.Upload;
import com.kh.ila.notice.model.service.NoticeService;
import com.kh.ila.notice.model.vo.Notice;
import com.kh.ila.notice.model.vo.PageInfo;
import com.kh.ila.notice.model.vo.Pagination;

@Controller
public class NoticeController {

		@Autowired
		private NoticeService noticeService;
		
		@Autowired
		Upload upload;
		@RequestMapping("enrollForm.no")
		public String noticeEnrollForm() {
			return "notice/noticeEnrollForm";
		}
		
		@RequestMapping("list.no")
		public String selectList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
			
			
			int listCount = noticeService.selectListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Notice> list = noticeService.selectList(pi);
			
			model.addAttribute("list",list);
			model.addAttribute("pi",pi);
			
			return "notice/noticeListView";

		}
		@RequestMapping("insert.no")
		public String insertBoard(Notice n, HttpServletRequest request, Model model, 
								  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
			
			
			if(!file.getOriginalFilename().equals("")) {
				
				String changeName = upload.saveFile(10,false,file, request);
				
				if(changeName != null) {
					n.setOriginName(file.getOriginalFilename());
					n.setChangeName(changeName);
				}
				
			}
			int result = noticeService.insertNotice(n);
			if(result >0) {
				return "redirect:list.no";
			}else {
				System.out.println("에러");
				return "";
			}
		}
		
		
		@RequestMapping("detail.no")
		public ModelAndView selectBoard(int nno, ModelAndView mv) {
		
			int result = noticeService.updateIncreaseCount(nno);
			if(result>0) {
				Notice n = noticeService.selectNotice(nno);
				System.out.println(n);
				mv.addObject("n",n).setViewName("notice/noticeDetail");
			}else {
				System.out.println("상세보기 에러");
			}
			return mv;
		}
		
		@RequestMapping("delete.no")
		public String deleteNotice(int nno, String fileName, HttpServletRequest request, Model model) {
			int result = noticeService.deleteNotice(nno);
			if(result > 0 ) {
				if(fileName.equals("")) {
					upload.deleteFile(10,fileName, request);
				}
				return "redirect:list.no";
			}else {
				System.out.println("게시물 삭제 시패");
				return "";
			}
			
			
		}
		
	
		
		@RequestMapping("updateForm.no")
		public ModelAndView updateFormNotice(int nno, ModelAndView mv) {
			mv.addObject("n", noticeService.selectNotice(nno)).setViewName("notice/noticeUpdateForm");
			return mv;
		}
		
		@RequestMapping("update.no")
		public ModelAndView updateNotice(Notice n, ModelAndView mv, HttpServletRequest request, 
										@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
			if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
				if(n.getChangeName() != null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
					upload.deleteFile(10,n.getChangeName(), request);
				}
				String changeName = upload.saveFile(10,false,file, request); // 새로 넘어온 파일을 서버에 업로드
				n.setOriginName(file.getOriginalFilename());
				n.setChangeName(changeName);
				
				
			}
		   int result = noticeService.updateNotice(n);
		   System.out.println(n);
		   System.out.println(result);
		   if(result > 0) {
				mv.addObject("nno",n.getNoticeNo()).setViewName("redirect:detail.no");
			}else {
				System.out.println("게시물 수정 실패");
			}
			return mv;
		}
		
}
