package com.kh.spring.member.model.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
		public String find_id(String email){
		System.out.println("serviceImp : "+ memberDao.find_id(sqlSession, email));
		return memberDao.find_id(sqlSession, email);
			
	}

	// 이메일 발송
	public void send_mail(Member member, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "아이디";
			String hostSMTPpwd = "비밀번호";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "아이디";
			String fromName = "ILIVEALONE Homepage";
			String subject = "";
			String msg = "";

			if(div.equals("find_pw")) {
				subject = "ILIVEALONE 홈페이지 임시 비밀번호 입니다.";
				msg += "<div align='center' style=border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += member.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하십시오.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += member.getUserPwd() + "</p></div>";
			}
			
			// 받는 사람 E-Mail 주소
			String mail = member.getEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		
	}
	
	// 비밀번호 찾기
		public void find_pw(HttpServletResponse response, Member member) {
			System.out.println("ServiceImp");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				int checkValue = memberDao.check_id(sqlSession,member.getUserId());
				System.out.println(checkValue);
				if(memberDao.check_id(sqlSession,member.getUserId()) == 0) {
					
					out.print("아이디가 없습니다.");
					out.close();
				}else if(!member.getEmail().equals(memberDao.login(sqlSession,member.getUserId()).getEmail())) {
					out.print("잘못된 이메일 입니다.");
					out.close();
					}else {
						// 임시 비밀번호 생성
						String pw = "";
						for (int i = 0; i < 12; i++) {
							pw += (char) ((Math.random() * 26) + 97);
						}
						member.setUserPwd(pw);
						// 비밀번호 변경
						memberDao.update_pw(sqlSession,member);
						// 비밀번호 변경 메일 발송
						send_mail(member, "find_pw");
						
						out.print("이메일로 임시 비밀번호를 발송하였습니다.");
						out.close();
					}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 아이디가 없으면
			// 가입에 사용한 이메일이 아니면
 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
}
