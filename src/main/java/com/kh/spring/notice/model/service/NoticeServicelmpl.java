package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.notice.model.vo.PageInfo;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServicelmpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int updateIncreaseCount(int nno) {
		// TODO Auto-generated method stub
		return noticeDao.updateIncreaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(int nno) {
		// TODO Auto-generated method stub
		return noticeDao.selectNotice(sqlSession,nno);
	}

	@Override
	public int deleteNotice(int nno) {
		// TODO Auto-generated method stub
		return noticeDao.deleteNotice(sqlSession,nno);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return noticeDao.updateNotice(sqlSession,n);
	}
	

}
