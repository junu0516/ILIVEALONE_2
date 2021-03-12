package com.kh.spring.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.Pagination;

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
	
	@RequestMapping("blist.bo")
	public String selectbList() {
		return "board/boardListView1";
	}
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value = "currentPage", required= false, defaultValue = "1") int currentPage, Model model) {
		/*
		 *  1. @RequestParam(value="currentPage") int currentPage --> @RequestParam 지정한 키 값이 존재하지 않다면  400 에러 (값을 주입할 수가 없어서)
		 *  
		 * 	2. @RequestParam(value="currentPage", required=false) int currentPage
		 * 					required : 해당 파라미터가 필수인지의 여부(true : 필수)required 속성 값을 따로 작성안할 경우 기본 값은 true
	     *   				-> required=true일 때 NULL 입력 시 400에러 발생
	     *   				-> 따라서 required=false로 지정하여 값을 받아줄 필요없다라고 선언(null이 들어올 수 있다.)
	     *   
	     *   				-> null이라는 데이터가 기본형이 int형에 들어갈 수 없기 때문에 
	     *  
	     *  3. 그럼 null일경우 기본값이 들어갈 수 있도록 지정
	     *    @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
	     *    				defaultValue : 넘어오는 값이 null일 경우 해당 파라미터의 기본값을 지정할 수 있다 .
	     *  
		 */
		
		int listCount = boardService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = boardService.selectList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "board/boardListView";

	}
	
	
	

	
	
}
