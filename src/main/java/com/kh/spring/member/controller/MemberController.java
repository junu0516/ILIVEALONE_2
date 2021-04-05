package com.kh.spring.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.common.exception.CommonException;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller 
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
			
			
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","로그인 실패!!");
			return "common/errorPage";
		}
		
		
	}
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	@RequestMapping(value="update.me", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
													 @RequestParam("address2") String address2, Model model) throws Exception {
		System.out.println("controller");
		System.out.println(m);
		m.setAddress(post+"/"+address1+"/"+address2);
		int result = memberService.updateMember(m);
		
		
		if(result > 0) {
			model.addAttribute("loginUser",m);
			return "member/myPage";
		}else {
			throw new Exception("회원정보 수정에 실패하였습니다");
		}
		
	}
	@RequestMapping("delete.me")
	public String deleteMember(String userId) throws Exception {
		int result = memberService.deleteMember(userId);
		
		if(result > 0) {
			
			return "redirect:logout.me";
		}else {
			throw new Exception("회원탈퇴에 실패하였습니다");
		}
	}
	
	   @RequestMapping(value="checkPwd.me",method=RequestMethod.POST)
	   @ResponseBody
	   public String checkPwd(@RequestParam("inputPwd")String inputPwd, HttpServletResponse response, HttpSession session) throws Exception {
	      
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      PrintWriter out = response.getWriter();

	      if(bCryptPasswordEncoder.matches(inputPwd,loginUser.getUserPwd())) {
	         out.print("success");
	      }else {
	         out.print("fail");
	      }   
	      
	      return null;
	   }
	   
	   @RequestMapping(value="updatePwd.me", method=RequestMethod.POST)
	   public String updatePassword(@RequestParam("newPwd")String newPwd, HttpSession session) {
	      
	      System.out.println("update 호출");
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      String userId = loginUser.getUserId();
	      String encPwd = bCryptPasswordEncoder.encode(newPwd);
	      
	      Member member = new Member();
	      member.setUserId(userId);
	      member.setUserPwd(encPwd);
	      
	      int result = memberService.updatePassword(member);
	      if(result>0) {
	    	 session.setAttribute("loginUser", loginUser);
	         loginUser.setUserPwd(encPwd);
	         return "redirect:/myPage.me";
	      }else {
	         throw new CommonException("비밀번호 변경 실패");
	      }
	      
	   }
	   
	   @ResponseBody
		@RequestMapping("idCheck.me")
		public String idCheck(String userId) {
			int count = memberService.idCheck(userId);
			
			return String.valueOf(count);
		}
	   
	   @RequestMapping("findPwd.me")
		public String findPwd() {
			return "member/findPwd";
		}
}
