package com.kh.spring.board.controller;

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
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.Pagination;
import com.kh.spring.board.model.vo.BoardSearchCondition;
import com.kh.spring.board.model.vo.BoradReply;
import com.kh.spring.board.model.vo.Fashion;
import com.kh.spring.board.model.vo.FashionReply;




@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("Toplist.bo")
	public String boardToplist() {
		return "board/boardTopListView";
	}
	@RequestMapping("enrollForm.bo")
	public String boardenrollForm() {
		
		return "board/boardEnrollForm";
	}
	@RequestMapping("enrollForm.fo")
	public String boardFenrollForm() {
		return "board/boardFEnrollForm";
	}
	
	@RequestMapping("main.do")
	public String mainForm() {
		return "main";
	}
	

	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = boardService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = boardService.selectList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "board/boardListView";

	}
	
	@RequestMapping("blist.bo")
	public String selectFList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = boardService.selectFListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Fashion> list = boardService.selectFList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "board/boardFListView";

	}
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, HttpServletRequest request, Model model, 
							  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
		
		System.out.println(b);
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				b.setOriginName(file.getOriginalFilename());
				b.setChangeName(changeName);
			}
			
		}
		int result = boardService.insertBoard(b);
		System.out.println(b);
		System.out.println(result);
		if(result >0) {
			return "redirect:list.bo";
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
	
	@RequestMapping("insert.fo")
	public String insertFBoard(Fashion f, HttpServletRequest request, Model model, 
							  @RequestParam(name="uploadFile", required =false) MultipartFile file) {
		
		System.out.println(f);
		System.out.println("file "+file);
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFFile(file, request);
			
			if(changeName != null) {
				f.setFashionOriginName(file.getOriginalFilename());
				f.setFashionChangeName(changeName);
			}
			
		}
		int result = boardService.insertFBoard(f);
		System.out.println(f);
		System.out.println(result);
		if(result >0) {
			return "redirect:blist.bo";
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
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
	
		int result = boardService.updateIncreaseCount(bno);
		System.out.println("조회수 : " + result);
		if(result>0) {
			Board b = boardService.selectBoard(bno);
			mv.addObject("b",b).setViewName("board/boardDetail");
		}else {
			System.out.println("상세보기 에러");
		}
		return mv;
	}
	
	@RequestMapping("detail.fo")
	public ModelAndView selectFBoard(int fno, ModelAndView mv) {
	
		int result = boardService.updateFIncreaseCount(fno);
		if(result>0) {
			Fashion f = boardService.selectFBoard(fno);
			mv.addObject("f",f).setViewName("board/boardFDetail");
		}else {
			System.out.println("상세보기 에러");
		}
		return mv;
	}
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String fileName, HttpServletRequest request, Model model) {
		int result = boardService.deleteBoard(bno);
		if(result > 0 ) {
			if(fileName.equals("")) {
				deleteFile(fileName, request);
			}
			return "redirect:list.bo";
		}else {
			System.out.println("게시물 삭제 시패");
			return "";
		}
		
		
	}
	
	@RequestMapping("delete.fo")
	public String deleteFBoard(int fno, String fileName, HttpServletRequest request, Model model) {
		int result = boardService.deleteFBoard(fno);
		if(result > 0 ) {
			if(fileName.equals("")) {
				deleteFFile(fileName, request);
			}
			return "redirect:blist.bo";
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
	
	private void deleteFFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		
		File deleteFFile = new File(savePath+fileName);
		deleteFFile.delete();
	}
	
	@RequestMapping("updateForm.bo")
	public ModelAndView updateFormBoard(int bno, ModelAndView mv) {
		mv.addObject("b", boardService.selectBoard(bno)).setViewName("board/boardUpdateForm");
		return mv;
	}
	
	@RequestMapping("updateForm.fo")
	public ModelAndView updateFormFBoard(int fno, ModelAndView mv) {
		mv.addObject("f", boardService.selectFBoard(fno)).setViewName("board/boardFUpdateForm");
		return mv;
	}
	
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(Board b, ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
			if(b.getChangeName() != null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				deleteFile(b.getChangeName(), request);
			}
			String changeName = saveFile(file, request); // 새로 넘어온 파일을 서버에 업로드
			b.setOriginName(file.getOriginalFilename());
			b.setChangeName(changeName);
			
			
		}
	   int result = boardService.updateBoard(b);
	   System.out.println(b);
	   System.out.println(result);
		if(result > 0) {
			mv.addObject("bno",b.getBoardNo()).setViewName("redirect:detail.bo");
		}else {
			System.out.println("게시물 수정 실패");
		}
		return mv;
	}
	
	@RequestMapping("update.fo")
	public ModelAndView updateFBoard(Fashion f, ModelAndView mv, HttpServletRequest request, 
									@RequestParam(value = "reUploadFile", required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) { //새로 넘어온 파일이 있는 경우 
			if(f.getFashionChangeName()!= null) { //새로 불러온 파일이 있는데 기존에 파일이 있는 경우 -> 서버에 업로드 되어있는 파일 삭제
				deleteFile(f.getFashionChangeName(), request);
			}
			String changeName = saveFile(file, request); // 새로 넘어온 파일을 서버에 업로드
			f.setFashionOriginName(file.getOriginalFilename());
			f.setFashionChangeName(changeName);
			
			
		}
	   int result = boardService.updateFBoard(f);
	   System.out.println(f);
	   System.out.println(result);
	
		if(result > 0) {
			mv.addObject("fno",f.getFashionNo()).setViewName("redirect:detail.fo");
		}else {
			System.out.println("게시물 수정 실패");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String insertReply(BoradReply r) {
		int result = boardService.insertReply(r);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("rinsert.fo")
	public String insertFReply(FashionReply r) {
		int result = boardService.insertFReply(r);
		return String.valueOf(result);
	}
	

	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
	public String selectReplyList(int bno) {
		ArrayList <BoradReply> list = boardService.selectReplyList(bno);
		
		return new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value = "rlist.fo", produces = "application/json; charset=UTF-8")
	public String selectFReplyList(int fno) {
		ArrayList <FashionReply> list = boardService.selectFReplyList(fno);
		
		return new GsonBuilder().setDateFormat("yyyy년MM월dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@RequestMapping("topList.bo")
	public void boardTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Board> list = boardService.selectTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	
	@RequestMapping("topList.fo")
	public void boardFTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Fashion> list = boardService.selectFTopList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list,response.getWriter());
	}
	
	
	//Serach 
	@GetMapping("search.bo")
	public String searchList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
			 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
			
			model.addAttribute("condition",condition);
			model.addAttribute("keyword",keyword);

			BoardSearchCondition searchCondition = new BoardSearchCondition();

			if(condition.equals("title")) {
				searchCondition.setTitle(keyword);
			}else if(condition.equals("content")) {
				searchCondition.setContent(keyword);
			}else {
				searchCondition.setWriter(keyword);
			}

			int listCount = boardService.selectListCount(searchCondition);
			PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
			model.addAttribute("pageInfo",pageInfo);

			ArrayList<Board> list = boardService.selectList(pageInfo,searchCondition);
			model.addAttribute("list",list);

			return "board/boardListView";
	}
	
	@GetMapping("search.fo")
	public String searchFList(@RequestParam(required=false)String condition, @RequestParam(required=false)String keyword, 
			 @RequestParam(required=false, defaultValue="1")int currentPage,Model model) {
			
			model.addAttribute("condition",condition);
			model.addAttribute("keyword",keyword);

			BoardSearchCondition searchCondition = new BoardSearchCondition();

			if(condition.equals("title")) {
				searchCondition.setTitle(keyword);
			}else if(condition.equals("content")) {
				searchCondition.setContent(keyword);
			}else {
				searchCondition.setWriter(keyword);
			}

			int listCount = boardService.selectFListCount(searchCondition);
			PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 6);
			model.addAttribute("pageInfo",pageInfo);

			ArrayList<Fashion> list = boardService.selectFList(pageInfo,searchCondition);
			model.addAttribute("list",list);

			return "board/boardFListView";
	}
	



}
