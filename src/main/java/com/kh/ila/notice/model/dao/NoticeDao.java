package com.kh.ila.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.notice.model.vo.Notice;
import com.kh.ila.notice.model.vo.PageInfo;

@Repository("noticeDao")
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getNoticeLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice",n);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int nno) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateIncreaseCount", nno);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

}
