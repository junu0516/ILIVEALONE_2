package com.kh.ila.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ila.member.model.dao.MemberDao;
import com.kh.ila.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	JavaMailSender mailSender;
	
	//회원가입 처리
	@Override
	public int insertMember(Member member) throws Exception {
		
		int result = memberDao.insertMember(sqlSession, member);
		
		return result;
	}

	//로그인 처리
	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member member) throws Exception {
		
		Member loginUser = memberDao.loginUser(sqlSession, member);
		
		//사용자 정보가 존재하는 지 확인
		if(loginUser == null) {
			throw new Exception("사용자 정보가 존재하지 않습니다.");
		}
		
		//입력한 비밀번호와 데이터베이스상의 비밀번호가 서로 일치하는 지 확인
		if(!bCryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
			throw new Exception("비밀번호를 다시 확인해주세요");
		}
		
		return loginUser;
	}

	//회원정보 수정
	@Override
	public int updateMember(Member member) {
		
		return memberDao.updateMember(sqlSession, member);
	}

	//회원 탈퇴
	@Override
	public int deleteMember(String userId) {
		
		return memberDao.deleteMember(sqlSession, userId);
	}
	
	//비밀번호 수정
	@Override
	public int updatePassword(Member member) {
	    
		return memberDao.updatePassword(sqlSession,member);
	}
	
	//아이디 입력 확인
	@Override
	public int idCheck(String userId) {
		
		return  memberDao.idCheck(sqlSession, userId);
	}

	// 아이디 찾기
	@Override
	public String find_id(HashMap<String,Object> mapKey){
	
		return memberDao.find_id(sqlSession, mapKey);	
	}
	
	//비밀번호 분실시 새로운 비밀번호로 수정
	@Override
	public int updateNewPwd(HashMap<String, Object> mapKey, String newPwd, String email) {
		
		//결과로 넘길 resultMap 생성(업데이트 성공 여부와 임시비밀번호를 담아 리턴)
		int result = memberDao.updateNewPwd(sqlSession,mapKey);
		
		/*
		 * 서비스레어에서의 트랜잭션이 전역으로 설정되어있기 때문에,
		 * 
		 * 이메일 전송 과정에서 오류가 발생하면, 기존의 비밀번호로 자동 롤백됨
		 * 
		 * */
		
		if(result>0) {//DB에서의 비밀번호가 일단 변경되면
			//메일 보내기
			result = sendEmail(email,newPwd);
			if(result>0) {
				//메일전송에 성공할 경우 1을 성공코드로 리턴
				System.out.println("메일전송 성공");
				return 1;
			}else {
				//메일전송에 실패할 경우 -1을 실패코드로 리턴
				System.out.println("메일 전송 실패");
				return -1;
			}
		}else {
			//DB에서의 비밀번호 변경이 실패하면 -1을 실패코드로 리턴
			System.out.println("메일을 전송하기 전에 아얘 비밀번호 변경에 실패");
			return -1;
		}
		
	}
	
	//이메일 전송 수행할 메소드
	private int sendEmail(String email, String newPwd) {
		String subject = "[ILIVEALONE]변경된 임시 비밀번호를 확인해주세요"; //메일제목
		String content = "변경된 비밀번호는 "+newPwd+" 입니다. \n \n 임시비밀번호로 로그인한 후 다시 비밀번호를 변경해주세요!"; //메일내용
		
		//보낼 메일 생성
		MimeMessage message = mailSender.createMimeMessage();
		//메일 제목, 내용, 받는이 정보 추가
		try {
			message.setSubject(subject);
			message.setText(content);
			message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			mailSender.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
			return -1;
		}
		
		return 1;
	}

}
