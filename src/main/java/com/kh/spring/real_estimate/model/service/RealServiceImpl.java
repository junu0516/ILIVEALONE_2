package com.kh.spring.real_estimate.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.real_estimate.model.dao.RealDao;
import com.kh.spring.real_estimate.model.vo.PageInfo;
import com.kh.spring.real_estimate.model.vo.Real;
import com.kh.spring.real_estimate.model.vo.RealWish;

@Service("realService")
public class RealServiceImpl implements RealService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	RealDao realDao;

	@Override
	public int selectListCount() {
		return realDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Real> selectList() {
		
		ArrayList<Real> list = realDao.selectList(sqlSession);
		System.out.println(list);
		return list;
	}


	@Override
	public Real selectReal(int rno) {
		// TODO Auto-generated method stub
		return realDao.selectReal(sqlSession,rno);
	}

	@Override
	public int insertReal(Real real) {
		// TODO Auto-generated method stub
		return realDao.insertReal(sqlSession,real);
	}

	@Override
	public int deleteReal(int rno) {
		// TODO Auto-generated method stub
		return realDao.deleteReal(sqlSession,rno);
	}

	@Override
	public int updateReal(Real r) {
		// TODO Auto-generated method stub
		return realDao.updateReal(sqlSession, r);
	}

	@Override
	public int insertWish(RealWish realWish) {
		// TODO Auto-generated method stub
		return realDao.insertWish(sqlSession, realWish);
	}

	@Override
	public int deleteStuffWish(int rno) {
		// TODO Auto-generated method stub
		return realDao.deleteStuffWish(sqlSession, rno);
	}

	@Override
	public ArrayList<Integer> selectWishList(String userId) {
		// TODO Auto-generated method stub
		return realDao.selectWishList(sqlSession,userId);
	}

	@Override
	public ArrayList<Real> selectRealList(ArrayList<Integer> list) {
		// TODO Auto-generated method stub
		return realDao.selectRealList(sqlSession,list);
	}

	@Override
	public int deleteWish(HashMap<String, String> mapKey) {
		// TODO Auto-generated method stub
		return realDao.deleteWish(sqlSession, mapKey);
	}

	
}
