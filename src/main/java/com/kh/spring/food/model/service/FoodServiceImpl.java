package com.kh.spring.food.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.food.model.dao.FoodDao;
import com.kh.spring.food.model.vo.Food;
import com.kh.spring.food.model.vo.PageInfo;
import com.kh.spring.food.model.vo.FoodSearchCondition;
import com.kh.spring.food.model.vo.FoodReply;
import com.kh.spring.food.model.vo.FoodP;
import com.kh.spring.food.model.vo.FoodPReply;

@Service("foodService")
public class FoodServiceImpl implements FoodService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FoodDao foodDao;
	
	@Override
	public int selectListCount() {
		return foodDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Food> selectList(PageInfo pi) {
		
		return foodDao.selectList(sqlSession,pi);
	}

	@Override
	public int insertfood(Food fd) {
	
		return foodDao.insertfood(sqlSession,fd);
	}

	@Override
	public int updateIncreaseCount(int fdno) {
		return foodDao.updateIncreaseCount(sqlSession,fdno);
	}

	@Override
	public Food selectfood(int fdno) {
		return foodDao.selectfood(sqlSession,fdno);
	}

	@Override
	public int deletefood(int fdno) {
		// TODO Auto-generated method stub
		return foodDao.deletefood(sqlSession,fdno);

	}

	@Override
	public int updatefood(Food fd) {
		return foodDao.updatefood(sqlSession,fd);
	}

	@Override
	public int insertReply(FoodReply r) {
		// TODO Auto-generated method stub
		return foodDao.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<FoodReply> selectReplyList(int fdno) {
		// TODO Auto-generated method stub
		return foodDao.selectReplyList(sqlSession, fdno);
	}
	
    //-------------------------------------------------------
	//  패션 사진 게시판 
	@Override
	public int selectPListCount() {
		// TODO Auto-generated method stub
		return foodDao.selectPListCount(sqlSession);
	}

	@Override
	public ArrayList<FoodP> selectPList(PageInfo pi) {
		
		return foodDao.selectPList(sqlSession,pi);
	}

	@Override
	public int insertPfood(FoodP fdp) {
		return foodDao.insertPfood(sqlSession,fdp);
	}

	@Override
	public int updatePIncreaseCount(int fdpno) {
		return foodDao.updatePIncreaseCount(sqlSession,fdpno);
	}
	
	@Override
	public FoodP selectPfood(int fdpno) {
		return foodDao.selectPfood(sqlSession,fdpno);
		
	}

	@Override
	public int deletePfood(int fdpno) {
		// TODO Auto-generated method stub
		return foodDao.deletePfood(sqlSession,fdpno);
	}

	@Override
	public int updatePfood(FoodP fdp) {
		// TODO Auto-generated method stub
		return foodDao.updatePfood(sqlSession,fdp);
	}

	@Override
	public int insertPReply(FoodPReply r) {
		// TODO Auto-generated method stub
		return foodDao.insertPReply(sqlSession,r);
	}

	@Override
	public ArrayList<FoodPReply> selectPReplyList(int fdpno) {
		// TODO Auto-generated method stub
		return foodDao.selectPReplyList(sqlSession, fdpno);
		}
    //---- top 리스트
	@Override
	public ArrayList<Food> selectTopList() {
		return foodDao.selectTopList(sqlSession);
	}

	@Override
	public ArrayList<FoodP> selectPTopList() {
		// TODO Auto-generated method stub
		return foodDao.selectPTopList(sqlSession);
	}

	@Override
	public int selectListCount(FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return foodDao.selectListCount(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<Food> selectList(PageInfo pageInfo, FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return foodDao.selectList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public int selectPListCount(FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return foodDao.selectPListCount(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<FoodP> selectPList(PageInfo pageInfo, FoodSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return foodDao.selectPList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public ArrayList<Food> selectOneTopList() {
		// TODO Auto-generated method stub
		return foodDao.selectOneTopList(sqlSession);
	}





	
}
