package com.kh.spring.used_trade.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.used_trade.model.vo.PageInfo;
import com.kh.spring.used_trade.model.vo.UsedMarket;

@Repository("usedMarketDao")
public class UsedMarketDao {
	
	public int insertUsedMarket(SqlSessionTemplate sqlSession, UsedMarket u) {
		// TODO Auto-generated method stub
		return sqlSession.insert("usedMarketMapper.insertUsedMarket",u);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("usedMarketMapper.selectListCount");
	}

	public ArrayList<UsedMarket> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getUsedMarketLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getUsedMarketLimit());
		
		
		return (ArrayList)sqlSession.selectList("usedMarketMapper.selectList",null,rowBounds);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		System.out.println("Dao uno: "+ uno);
		return sqlSession.update("usedMarketMapper.updateIncreaseCount",uno);
		
	}

	public UsedMarket selectBoard(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("usedMarketMapper.selectUsedMarket",uno);
	}
	
	

	/*public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit(); //건너 뛰어야할 수
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return  (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		System.out.println("Dao bno : "+bno);

		return sqlSession.update("boardMapper.updateIncreaseCount",bno);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
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

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopList");
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertReply",r);
	}

	public ArrayList<Board> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",bno);
	}
*/
	

}
