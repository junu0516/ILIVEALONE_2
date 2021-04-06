package com.kh.spring.member.model.dao;

import javax.mail.Session;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	   public int updatePassword(SqlSessionTemplate sqlSession, Member member) {
		      return sqlSession.update("memberMapper.updatePassword",member);
	 }

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	// 아이디 찾기
	public String find_id(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.find_id", email);
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(SqlSessionTemplate sqlSession, Member member) throws Exception{
		return sqlSession.update("memberMapper.update_pw", member);
	}

	public int check_id(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.check_id", userId);
	}

	public Member login(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.check_id_email", email);
	}

	
	
}
