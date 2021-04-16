package com.kh.ila.member.model.dao;

import java.util.HashMap;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	
	//로그인 처리
	public Member loginUser(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}
	
	//회원가입 처리
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	//회원정보 수정
	public int updateMember(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.update("memberMapper.updateMember", member);
	}
	
	//회원 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
	}
	
	//비밀번호 수정
	public int updatePassword(SqlSessionTemplate sqlSession, Member member) {
		   
		return sqlSession.update("memberMapper.updatePassword",member);
	}
	
	//아이디 입력 확인
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	// 아이디 찾기
	public String find_id(SqlSessionTemplate sqlSession, HashMap<String, Object> mapKey) {
		
		return sqlSession.selectOne("memberMapper.find_id", mapKey);
	}
	
	// 비밀번호 변경
	public int update_pw(SqlSessionTemplate sqlSession, Member member) throws Exception{
		
		return sqlSession.update("memberMapper.update_pw", member);
	}
	
	//비밀번호 분실시 새로운 비밀번호로 수정
	public int updateNewPwd(SqlSessionTemplate sqlSession, HashMap<String, Object> mapKey) {
	
		return sqlSession.update("memberMapper.updateNewPwd",mapKey);
	}
}
