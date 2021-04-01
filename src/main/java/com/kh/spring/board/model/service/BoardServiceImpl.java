package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.BoardSearchCondition;
import com.kh.spring.board.model.vo.BoradReply;
import com.kh.spring.board.model.vo.Fashion;
import com.kh.spring.board.model.vo.FashionReply;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return boardDao.selectList(sqlSession,pi);
	}

	@Override
	public int insertBoard(Board b) {
	
		return boardDao.insertBoard(sqlSession,b);
	}

	@Override
	public int updateIncreaseCount(int bno) {
		return boardDao.updateIncreaseCount(sqlSession,bno);
	}

	@Override
	public Board selectBoard(int bno) {
		return boardDao.selectBoard(sqlSession,bno);
	}

	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return boardDao.deleteBoard(sqlSession,bno);

	}

	@Override
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession,b);
	}

	@Override
	public int insertReply(BoradReply r) {
		// TODO Auto-generated method stub
		return boardDao.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<BoradReply> selectReplyList(int bno) {
		// TODO Auto-generated method stub
		return boardDao.selectReplyList(sqlSession, bno);
	}
	
    //-------------------------------------------------------
	//  패션 사진 게시판 
	@Override
	public int selectFListCount() {
		// TODO Auto-generated method stub
		return boardDao.selectFListCount(sqlSession);
	}

	@Override
	public ArrayList<Fashion> selectFList(PageInfo pi) {
		
		return boardDao.selectFList(sqlSession,pi);
	}

	@Override
	public int insertFBoard(Fashion f) {
		return boardDao.insertFBoard(sqlSession,f);
	}

	@Override
	public int updateFIncreaseCount(int fno) {
		return boardDao.updateFIncreaseCount(sqlSession,fno);
	}
	
	@Override
	public Fashion selectFBoard(int fno) {
		return boardDao.selectFBoard(sqlSession,fno);
		
	}

	@Override
	public int deleteFBoard(int fno) {
		// TODO Auto-generated method stub
		return boardDao.deleteFBoard(sqlSession,fno);
	}

	@Override
	public int updateFBoard(Fashion f) {
		// TODO Auto-generated method stub
		return boardDao.updateFBoard(sqlSession,f);
	}

	@Override
	public int insertFReply(FashionReply r) {
		// TODO Auto-generated method stub
		return boardDao.insertFReply(sqlSession,r);
	}

	@Override
	public ArrayList<FashionReply> selectFReplyList(int fno) {
		// TODO Auto-generated method stub
		return boardDao.selectFReplyList(sqlSession, fno);
		}
    //---- top 리스트
	@Override
	public ArrayList<Board> selectTopList() {
		return boardDao.selectTopList(sqlSession);
	}

	@Override
	public ArrayList<Fashion> selectFTopList() {
		// TODO Auto-generated method stub
		return boardDao.selectFTopList(sqlSession);
	}

	@Override
	public int selectListCount(BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return boardDao.selectListCount(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pageInfo, BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return boardDao.selectList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public int selectFListCount(BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return boardDao.selectFListCount(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<Fashion> selectFList(PageInfo pageInfo, BoardSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return boardDao.selectFList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	//1위 탑 리스트 
	public ArrayList<Board> selectOneTopList() {
		return boardDao.selectOneTopList(sqlSession);
		
	}





	
}
