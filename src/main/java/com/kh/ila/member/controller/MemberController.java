package com.kh.ila.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
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

import com.kh.ila.common.exception.CommonException;
import com.kh.ila.member.model.service.MemberService;
import com.kh.ila.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //로그아웃
    @RequestMapping("logout.me")
    public String logout(SessionStatus status) {

        //세션을 모두 해제
        status.setComplete();

        return "redirect:/";
    }

    //회원가입 페이지로 이동
    @RequestMapping("enrollForm.me")
    public String enrollForm() {

        return "member/memberEnrollForm";
    }

    //회원가입 처리
    @RequestMapping("insert.me")
    public String insertMember(@ModelAttribute Member member, @RequestParam("post") String post,
    														  @RequestParam("address1") String address1,
    														  @RequestParam("address2") String address2, 
    														  HttpSession session) throws Exception {

        //우편번호, 시군구, 세부주소를 합쳐 address 변수에 담아줌
        member.setAddress(post + "/" + address1 + "/" + address2);

        //입력한 비밀번호를 암호화하여, 객체에 저장
        String encPwd = bCryptPasswordEncoder.encode(member.getUserPwd());
        member.setUserPwd(encPwd);

        int result = memberService.insertMember(member);

        if (result > 0) {
            session.setAttribute("msg", "회원가입성공!!");
            return "redirect:/";
        } else {
            return "common/errorPage";
        }
    }

    //로그인 처리
    @RequestMapping(value = "login.me", method = RequestMethod.POST)
    public String loginMember(Member member, Model model) {

        Member loginUser;

        try {

            loginUser = memberService.loginMember(bCryptPasswordEncoder, member);
            model.addAttribute("loginUser", loginUser);
            return "redirect:/";

        } catch (Exception e) {

            //서비스 레이어에서 예외가 발생하면, 컨트롤러에서 예외를 받아 처리하여 로그인 실패를 최종적으로 처리
            e.printStackTrace();
            model.addAttribute("msg", "로그인 실패!!");
            return "common/errorPage";
        }
    }

    //마이페이지로 이동
    @RequestMapping("myPage.me")
    public String myPage() {
        return "member/myPage";
    }

    //회원정보 수정
    @RequestMapping(value = "update.me", method = RequestMethod.POST)
    public String updateMember(@ModelAttribute Member member, @RequestParam("post") String post, 
    														  @RequestParam("address1") String address1, 
    														  @RequestParam("address2") String address2, 
    														  Model model) throws Exception {

        member.setAddress(post + "/" + address1 + "/" + address2);
        int result = memberService.updateMember(member);

        if (result > 0) {
            model.addAttribute("loginUser", member);
            return "member/myPage";
        } else {
            throw new Exception("회원정보 수정에 실패하였습니다");
        }

    }

    //회원 탈퇴
    @RequestMapping("delete.me")
    public String deleteMember(String userId) throws Exception {
        
    	int result = memberService.deleteMember(userId);

        if (result > 0) {

            return "redirect:logout.me";
        } else {
            throw new Exception("회원탈퇴에 실패하였습니다");
        }
    }

    @RequestMapping(value = "checkPwd.me", method = RequestMethod.POST)
    @ResponseBody
    public String checkPwd(@RequestParam("inputPwd") String inputPwd, HttpServletResponse response, HttpSession session) throws Exception {

        Member loginUser = (Member) session.getAttribute("loginUser");
        PrintWriter out = response.getWriter();

        if (bCryptPasswordEncoder.matches(inputPwd, loginUser.getUserPwd())) {
            out.print("success");
        } else {
            out.print("fail");
        }

        return null;
    }

    @RequestMapping(value = "updatePwd.me", method = RequestMethod.POST)
    public String updatePassword(@RequestParam("newPwd") String newPwd, HttpSession session) {

        System.out.println("update 호출");
        Member loginUser = (Member) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();
        String encPwd = bCryptPasswordEncoder.encode(newPwd);

        Member member = new Member();
        member.setUserId(userId);
        member.setUserPwd(encPwd);

        int result = memberService.updatePassword(member);
        if (result > 0) {
            session.setAttribute("loginUser", loginUser);
            loginUser.setUserPwd(encPwd);
            return "redirect:/myPage.me";
        } else {
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

    // 아이디 찾기 폼
    @RequestMapping(value = "/find_id_form.do")
    public String find_id_form() throws Exception {
        return "/member/find_id_form";
    }

    // 아이디 찾기
    @RequestMapping(value = "/find_id.do", method = RequestMethod.POST)

    public String find_id(@RequestParam("email") String email, Model md, @RequestParam("phone") String phone) throws Exception {

        HashMap < String, Object > mapKey = new HashMap < > ();
        mapKey.put("email", email);
        mapKey.put("phone", phone);
        String userChk = memberService.find_id(mapKey);
        if (userChk == null) {
            md.addAttribute("userId", "검색된아이디가 존재하지 않습니다.");
        } else {
            md.addAttribute("userId", userChk);
        }

        return "/member/find_id";
    }

    // 비밀번호 찾기 폼
    @RequestMapping(value = "/find_pw_form.do")
    public String find_pw_form() throws Exception {
        return "/member/find_pw_form";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
    @ResponseBody
    public String find_pw(String userId, String email, HttpServletResponse response) throws Exception {

        //일단 새로운 비밀번호로 변경하기
        HashMap < String, Object > mapKey = new HashMap < > ();
        mapKey.put("userId", userId);

        //임시비밀번호 생성
        String newPwd = "";
        for (int i = 0; i < 12; i++) {
            newPwd += (char)((Math.random() * 26) + 97);
        }

        //암호화 한 비밀번호를 mapKey에 추가하여 서비스 레이어로 넘겨 메일 전송
        String encoded = bCryptPasswordEncoder.encode(newPwd);
        mapKey.put("newPwd", encoded);

        int result = memberService.updateNewPwd(mapKey, newPwd, email);

        //result 결과값에 따라 각기 다른 ajax 결과값 전송
        PrintWriter out = response.getWriter();
        if (result > 0) {
            out.print("success");
        } else {
            out.print("fail");
        }

        return null;
    }
}