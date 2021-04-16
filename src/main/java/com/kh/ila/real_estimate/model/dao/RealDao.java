package com.kh.ila.real_estimate.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.real_estimate.model.vo.PageInfo;
import com.kh.ila.real_estimate.model.vo.Real;
import com.kh.ila.real_estimate.model.vo.RealWish;

@Repository("realDao")
public class RealDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("realMapper.selectListCount");
	}

	public ArrayList<Real> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("realMapper.selectList"); //여기서는 따로 파라미터는 없음
	}

	public Real selectReal(SqlSessionTemplate sqlSession, int rno) {
		// TODO Auto-generated method stub
		return	sqlSession.selectOne("realMapper.selectReal", rno);
	}

	public int insertReal(SqlSessionTemplate sqlSession, Real real) {
		// TODO Auto-generated method stub
		return sqlSession.insert("realMapper.insertReal",real);
	}

	public int deleteReal(SqlSessionTemplate sqlSession, int rno) {
		// TODO Auto-generated method stub
		return	sqlSession.update("realMapper.deleteReal", rno);
	}

	public int updateReal(SqlSessionTemplate sqlSession, Real r) {
		// TODO Auto-generated method stub
		return	sqlSession.update("realMapper.updateReal", r);
	}


	public int insertWish(SqlSessionTemplate sqlSession, RealWish realWish) {
		int result;
		
		try {
			result= sqlSession.insert("realWishMapper.insertWish", realWish);
		}catch(Exception e) {
			result=0;
		}
		
		return result;
	}

	public int deleteStuffWish(SqlSessionTemplate sqlSession, int rno) {
		// TODO Auto-generated method stub
		return	sqlSession.update("realWishMapper.deleteStuffWish", rno);
	}

	public ArrayList<Integer> selectWishList(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("realWishMapper.selectWishList",userId);
	}

	public ArrayList<Real> selectRealList(SqlSessionTemplate sqlSession, ArrayList<Integer> list) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("realMapper.selectRealList",list);
		
	}

	public int deleteWish(SqlSessionTemplate sqlSession, HashMap<String, String> mapKey) {
		// TODO Auto-generated method stub
		
		return	sqlSession.update("realWishMapper.deleteWish", mapKey);
	}

}
