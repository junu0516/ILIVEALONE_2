package com.kh.spring.member.model.service;

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
}
