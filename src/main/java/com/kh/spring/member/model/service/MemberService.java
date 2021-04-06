package com.kh.spring.member.model.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws Exception;
	
	int insertMember(Member m) throws Exception;

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) throws Exception;

	int updateMember(Member m);

	int deleteMember(String userId);

	int updatePassword(Member member);

	int idCheck(String userId);

	String find_id(String email);

	void find_pw(HttpServletResponse response, Member member);


	
}
