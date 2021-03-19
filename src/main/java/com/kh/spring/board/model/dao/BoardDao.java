package com.kh.spring.board.model.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.BoardSearchCondition;
import com.kh.spring.board.model.vo.BoradReply;
import com.kh.spring.board.model.vo.Fashion;
import com.kh.spring.board.model.vo.FashionReply;


@Repository("boardDao")
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
		}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);

	}
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.updateIncreaseCount",bno);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard",bno);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteBoard",bno);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateBoard",b);
	}

	public int insertReply(SqlSessionTemplate sqlSession, BoradReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertReply",r);
	}

	public ArrayList<BoradReply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bno);
	}

	// --------------------------------------------------------
	// 패션 사진 게시판 
	public int selectFListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFListCount");
	}

	public ArrayList<Fashion> selectFList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectFList", null, rowBounds);

	}

	public int insertFBoard(SqlSessionTemplate sqlSession, Fashion f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertFBoard",f);
	}

	public int updateFIncreaseCount(SqlSessionTemplate sqlSession, int fno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateFIncreaseCount",fno);
	}

	public Fashion selectFBoard(SqlSessionTemplate sqlSession, int fno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectFBoard",fno);
	}

	public int deleteFBoard(SqlSessionTemplate sqlSession, int fno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteFBoard",fno);
	}

	public int updateFBoard(SqlSessionTemplate sqlSession, Fashion f) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateFBoard",f);
	}

	public int insertFReply(SqlSessionTemplate sqlSession, FashionReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertFReply",r);
	}

	public ArrayList<FashionReply> selectFReplyList(SqlSessionTemplate sqlSession, int fno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectFReplyList", fno);
	}
	
	// 패션 top 리스트 
	public ArrayList<Board> selectTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopList");	
	}

	public ArrayList<Fashion> selectFTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectFTopList");	
	}

	public int selectListCount(SqlSessionTemplate sqlSession, BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectSearchListCount", searchCondition);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		int offset = (pageInfo.getCurrentPage()-1) *pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", searchCondition, rowBounds);
	}

	public int selectFListCount(SqlSessionTemplate sqlSession, BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectSearchFListCount", searchCondition);
	}

	public ArrayList<Fashion> selectFList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		int offset = (pageInfo.getCurrentPage()-1) *pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchFList", searchCondition, rowBounds);

	}


}
