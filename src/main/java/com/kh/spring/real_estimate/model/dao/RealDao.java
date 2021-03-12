package com.kh.spring.real_estimate.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.real_estimate.model.vo.PageInfo;
import com.kh.spring.real_estimate.model.vo.Real;

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

}
