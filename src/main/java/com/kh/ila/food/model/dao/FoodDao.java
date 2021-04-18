package com.kh.ila.food.model.dao;

import java.util.ArrayList;

import com.kh.ila.common.paging.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.food.model.vo.Food;
import com.kh.ila.food.model.vo.FoodP;
import com.kh.ila.food.model.vo.FoodPReply;
import com.kh.ila.food.model.vo.FoodReply;
import com.kh.ila.food.model.vo.FoodSearchCondition;


@Repository("foodDao")
public class FoodDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("foodMapper.selectListCount");
		}

	public ArrayList<Food> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("foodMapper.selectList", null, rowBounds);

	}
	public int insertfood(SqlSessionTemplate sqlSession, Food fd) {
		return sqlSession.insert("foodMapper.insertfood",fd);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int fdno) {
		return sqlSession.update("foodMapper.updateIncreaseCount",fdno);
	}

	public Food selectfood(SqlSessionTemplate sqlSession, int fdno) {
		return sqlSession.selectOne("foodMapper.selectfood",fdno);
	}

	public int deletefood(SqlSessionTemplate sqlSession, int fdno) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.deletefood",fdno);
	}

	public int updatefood(SqlSessionTemplate sqlSession, Food fd) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.updatefood",fd);
	}

	public int insertReply(SqlSessionTemplate sqlSession, FoodReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("foodMapper.insertReply",r);
	}

	public ArrayList<FoodReply> selectReplyList(SqlSessionTemplate sqlSession, int fdno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.selectReplyList", fdno);
	}

	// --------------------------------------------------------
	// 패션 사진 게시판 
	public int selectPListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("foodMapper.selectPListCount");
	}

	public ArrayList<FoodP> selectPList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("foodMapper.selectPList", null, rowBounds);

	}

	public int insertPfood(SqlSessionTemplate sqlSession, FoodP fdp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("foodMapper.insertPfood",fdp);
	}

	public int updatePIncreaseCount(SqlSessionTemplate sqlSession, int fdpno) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.updatePIncreaseCount",fdpno);
	}

	public FoodP selectPfood(SqlSessionTemplate sqlSession, int fdpno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("foodMapper.selectPfood",fdpno);
	}

	public int deletePfood(SqlSessionTemplate sqlSession, int fdpno) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.deletePfood",fdpno);
	}

	public int updatePfood(SqlSessionTemplate sqlSession, FoodP fdp) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.updatePfood",fdp);
	}

	public int insertPReply(SqlSessionTemplate sqlSession, FoodPReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("foodMapper.insertPReply",r);
	}

	public ArrayList<FoodPReply> selectPReplyList(SqlSessionTemplate sqlSession, int fdpno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.selectPReplyList", fdpno);
	}
	
	// 패션 top 리스트 
	public ArrayList<Food> selectTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.selectTopList");	
	}

	public ArrayList<FoodP> selectPTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.selectPTopList");	
	}

	public int selectListCount(SqlSessionTemplate sqlSession, FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("foodMapper.selectSearchListCount", searchCondition);
	}

	public ArrayList<Food> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		int offset = (pageInfo.getCurrentPage()-1) *pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		return (ArrayList)sqlSession.selectList("foodMapper.selectSearchList", searchCondition, rowBounds);
	}

	public int selectPListCount(SqlSessionTemplate sqlSession, FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("foodMapper.selectSearchPListCount", searchCondition);
	}

	public ArrayList<FoodP> selectPList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		int offset = (pageInfo.getCurrentPage()-1) *pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		return (ArrayList)sqlSession.selectList("foodMapper.selectSearchPList", searchCondition, rowBounds);

	}

	public ArrayList<Food> selectOneTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.selectOneTopList");	
	}


}
