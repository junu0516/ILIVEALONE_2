package com.kh.ila.member.model.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.ila.member.model.dao.MemberDao;
import com.kh.ila.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member) throws Exception;

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member member) throws Exception;

	int updateMember(Member member);

	int deleteMember(String userId);

	int updatePassword(Member member);

	int idCheck(String userId);

	String find_id(HashMap<String, Object> mapKey);

	int updateNewPwd(HashMap<String, Object> mapKey, String newPwd, String email);	
}
