package com.kh.ila.used_trade.model.dao;

import java.util.ArrayList;

import com.kh.ila.common.paging.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.used_trade.model.vo.UsedMarket;

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
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("usedMarketMapper.selectList",null,rowBounds);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		System.out.println("Dao uno: "+ uno);
		return sqlSession.update("usedMarketMapper.updateIncreaseCount",uno);
		
	}

	public UsedMarket selectUsedMarket(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("usedMarketMapper.selectUsedMarket",uno);
	}

	public int updateUsedMarket(SqlSessionTemplate sqlSession, UsedMarket u) {
		// TODO Auto-generated method stub
		return sqlSession.update("usedMarketMapper.updateUsedMarket",u);
	}

	public int deleteUsedMarket(SqlSessionTemplate sqlSession, int uno) {
		// TODO Auto-generated method stub
		return sqlSession.update("usedMarketMapper.deleteUsedMarket",uno);

	}

	public ArrayList<UsedMarket> selectListCategory(SqlSessionTemplate sqlSession, PageInfo pi, String category) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("usedMarketMapper.selectListCategory",category,rowBounds);
		
	}
	
	

	

}
