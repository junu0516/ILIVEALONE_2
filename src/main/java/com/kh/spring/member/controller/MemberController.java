package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller
@SessionAttributes({"loginUser","userId"})
public class MemberController {
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
	
		status.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
	
		return "member/memberEnrollForm";
	}
		
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2, HttpSession session) throws Exception{
															 
		m.setAddress(post+"/"+address1+"/"+address2);
		
		System.out.println(m);
		
		System.out.println("암호화전"+m.getUserPwd());
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("암호화후"+encPwd);
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("msg", "회원가입성공!!");
			return "redirect:/";
		}else {
			return "common/errorPage";
		}
		
	}		
		
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String loginMember(Member m, Model model) {
	
		Member loginUser;
		
		try {
		
			loginUser=memberService.loginMember(bCryptPasswordEncoder, m);
			String userId = loginUser.getUserId();
			model.addAttribute("loginUser",loginUser);
			model.addAttribute("userId",userId);
			
			return "redirect:/";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","로그인실패!!");
			return "common/errorPage";
		}
		
	}
}
