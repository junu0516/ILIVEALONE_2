package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("dao 진입");
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("Member : "+m);
		return sqlSession.insert("memberMapper.insertMember", m);
	
	}


	
}
