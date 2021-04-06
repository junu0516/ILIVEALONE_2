package com.kh.spring.member.model.service;

import java.util.HashMap;

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

	String find_id(HashMap<String, Object> mapKey);

	void find_pw(HttpServletResponse response, Member member);

	int updateNewPwd(HashMap<String, Object> mapKey, String newPwd, String email);

	

	
}
