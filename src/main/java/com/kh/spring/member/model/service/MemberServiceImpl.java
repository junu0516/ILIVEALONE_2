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

	@Override
	public int pwdCheck(String userPwd) {
		// TODO Auto-generated method stub
		return memberDao.pwdCheck(sqlSession, userPwd);
	}

}
