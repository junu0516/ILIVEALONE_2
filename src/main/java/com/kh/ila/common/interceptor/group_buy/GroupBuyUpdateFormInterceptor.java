package com.kh.ila.common.interceptor.group_buy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.ila.group_buy.model.service.GroupBuyService;
import com.kh.ila.group_buy.model.vo.GroupBuyBoard;
import com.kh.ila.member.model.vo.Member;

public class GroupBuyUpdateFormInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	GroupBuyService groupBuyService;
	
	private Logger log = LoggerFactory.getLogger(GroupBuyUpdateFormInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			log.info("비로그인 상태에서 ["+request.getRequestURI()+"]에 접근하려고 합니다.");
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message", "로그인 후 이용하세요");
			response.sendRedirect("/spring");
			
			return false; 
		}else {
			
			//로그인한 사용자 아이디와, 글 작성자 아이디가 다를 경우에는 유효하지 않은 접근으로 처리
			int gbNo = Integer.parseInt(request.getParameter("gbNo"));
			GroupBuyBoard groupBuyBoard = groupBuyService.selectBoard(gbNo);
			
			if(!loginUser.getUserId().equals(groupBuyBoard.getGbMno())) {
				System.out.println("유효하지 않은 접근");
				response.sendRedirect("/spring/list.gb");
				
				return false;
			};
			
			return super.preHandle(request, response, handler);
		}
		
	}

}
