package com.kh.spring.member.model.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	
	public Member loginMember(Member m) throws Exception{
		
		Member loginUser = memberDao.loginUser(sqlSession, m);
		System.out.println(loginUser);
		
		return loginUser;
		
	}
	
	@Override
	public int insertMember(Member m) throws Exception {
		int result = memberDao.insertMember(sqlSession, m);
		return result;
	}


	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) throws Exception {
		// TODO Auto-generated method stub
		Member loginUser = memberDao.loginUser(sqlSession, m);
		System.out.println(loginUser);
		if(loginUser == null) {
			throw new Exception("loginUser확인하세요");
		}
		if(!bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			throw new Exception("암호불일치!!");
		}
		return loginUser;
	}

	
	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		System.out.println("service");
		return memberDao.updateMember(sqlSession, m);
		
		/*int result = memberDao.updateMember(sqlSession, m);
		int result1 = memberDao.insertMember(sqlSession, m);
		
		if(result>0 && result>0) {
			return 1;
		}else {
			return 0;
		}*/
	}


	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return memberDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int updatePassword(Member member) {
	    return memberDao.updatePassword(sqlSession,member);
	}
	
	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return  memberDao.idCheck(sqlSession, userId);
	}

	
	// 아이디 찾기
	@Override
		public String find_id(HttpServletResponse response, String email, MemberDao manager) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = manager.find_id(email);
			
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override
	public String find_id(String email) {
		// TODO Auto-generated method stub
		return  memberDao.find_id(sqlSession, email);
	}

	public String find_id(HttpServletResponse response, String email) throws Exception {
		// TODO Auto-generated method stub
		return  memberDao.find_id(sqlSession, email);
		
	}

	

}
