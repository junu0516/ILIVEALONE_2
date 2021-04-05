package com.kh.spring.common.interceptor.group_buy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.spring.member.model.vo.Member;

public class GroupBuyInsertViewInterceptor extends HandlerInterceptorAdapter {

	private Logger log = LoggerFactory.getLogger(GroupBuyInsertViewInterceptor.class);
	
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
			return super.preHandle(request, response, handler);
		}
		
	}

}
