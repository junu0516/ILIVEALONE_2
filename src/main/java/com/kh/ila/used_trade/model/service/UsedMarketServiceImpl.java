package com.kh.ila.used_trade.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ila.used_trade.model.dao.UsedMarketDao;
import com.kh.ila.used_trade.model.vo.PageInfo;
import com.kh.ila.used_trade.model.vo.UsedMarket;

@Service("usedMarketService")
public class UsedMarketServiceImpl implements UsedMarketService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UsedMarketDao usedMarketDao; 
	

	@Override
	public int insertUsedMarket(UsedMarket u) {
		// TODO Auto-generated method stub
		return usedMarketDao.insertUsedMarket(sqlSession,u);
	}


	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return usedMarketDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<UsedMarket> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return usedMarketDao.selectList(sqlSession,pi);
	}


	@Override
	public int updateIncreaseCount(int uno) {
		// TODO Auto-generated method stub
		System.out.println("serviceImp uno" + uno);
		
		return usedMarketDao.updateIncreaseCount(sqlSession,uno);
	}


	@Override
	public UsedMarket selectUsedMarket(int uno) {
		// TODO Auto-generated method stub
		return usedMarketDao.selectUsedMarket(sqlSession,uno);
	}


	@Override
	public int updateUsedMarket(UsedMarket u) {
		// TODO Auto-generated method stub
		return usedMarketDao.updateUsedMarket(sqlSession,u);
	}


	@Override
	public int deleteUsedMarket(int uno) {
		// TODO Auto-generated method stub
		return usedMarketDao.deleteUsedMarket(sqlSession,uno);
	}


	@Override
	public ArrayList<UsedMarket> selectListCategory(PageInfo pi, String category) {
		// TODO Auto-generated method stub
		return usedMarketDao.selectListCategory(sqlSession,pi,category);
	}



	
	

	
	/*
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		
		return boardDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return boardDao.selectList(sqlSession,pi);
	}


	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return boardDao.insertBoard(sqlSession,b);
	}


	@Override
	public int updateIncreaseCount(int bno) {
		// TODO Auto-generated method stub
		System.out.println("serviceImp bno : "+bno);
		return boardDao.updateIncreaseCount(sqlSession,bno);
	}


	@Override
	public Board selectBoard(int bno) {
		// TODO Auto-generated method stub
		return boardDao.selectBoard(sqlSession,bno);
	}


	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return boardDao.deleteBoard(sqlSession,bno);
	}


	@Override
	public int updateBoard(Board b) {

		// TODO Auto-generated method stub
		return boardDao.updateBoard(sqlSession,b);
	}


	@Override
	public ArrayList<Board> selectTopList() {
		// TODO Auto-generated method stub
		return boardDao.selectList(sqlSession);
	}


	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return boardDao.insertReply(sqlSession,r);
	}


	@Override
	public ArrayList<Board> selectReplyList(int bno) {
		// TODO Auto-generated method stub
		return boardDao.selectReplyList(sqlSession,bno);
	}
*/
	
	
}
