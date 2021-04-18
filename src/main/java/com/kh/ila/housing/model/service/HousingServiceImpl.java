package com.kh.ila.housing.model.service;

import java.util.ArrayList;

import com.kh.ila.common.paging.PageInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ila.housing.model.dao.HousingDao;
import com.kh.ila.housing.model.vo.Housing;
import com.kh.ila.housing.model.vo.HousingP;
import com.kh.ila.housing.model.vo.HousingPReply;
import com.kh.ila.housing.model.vo.HousingReply;
import com.kh.ila.housing.model.vo.HousingSearchCondition;

@Service("housingService")
public class HousingServiceImpl implements HousingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HousingDao housingDao;
	
	@Override
	public int selectListCount() {
		return housingDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Housing> selectList(PageInfo pi) {
		
		return housingDao.selectList(sqlSession,pi);
	}

	@Override
	public int inserthousing(Housing h) {
	
		return housingDao.inserthousing(sqlSession,h);
	}

	@Override
	public int updateIncreaseCount(int hno) {
		return housingDao.updateIncreaseCount(sqlSession,hno);
	}

	@Override
	public Housing selecthousing(int hno) {
		return housingDao.selecthousing(sqlSession,hno);
	}

	@Override
	public int deletehousing(int hno) {
		// TODO Auto-generated method stub
		return housingDao.deletehousing(sqlSession,hno);

	}

	@Override
	public int updatehousing(Housing h) {
		return housingDao.updatehousing(sqlSession,h);
	}

	@Override
	public int insertReply(HousingReply r) {
		// TODO Auto-generated method stub
		return housingDao.insertReply(sqlSession,r);
	}

	@Override
	public ArrayList<HousingReply> selectReplyList(int hno) {
		// TODO Auto-generated method stub
		return housingDao.selectReplyList(sqlSession, hno);
	}
	
    //-------------------------------------------------------
	//  패션 사진 게시판 
	@Override
	public int selectPListCount() {
		// TODO Auto-generated method stub
		return housingDao.selectPListCount(sqlSession);
	}

	@Override
	public ArrayList<HousingP> selectPList(PageInfo pi) {
		
		return housingDao.selectPList(sqlSession,pi);
	}

	@Override
	public int insertPhousing(HousingP hp) {
		return housingDao.insertPhousing(sqlSession,hp);
	}

	@Override
	public int updatePIncreaseCount(int hpno) {
		return housingDao.updatePIncreaseCount(sqlSession,hpno);
	}
	
	@Override
	public HousingP selectPhousing(int hpno) {
		return housingDao.selectPhousing(sqlSession,hpno);
		
	}

	@Override
	public int deletePhousing(int hpno) {
		// TODO Auto-generated method stub
		return housingDao.deletePhousing(sqlSession,hpno);
	}

	@Override
	public int updatePhousing(HousingP hp) {
		// TODO Auto-generated method stub
		return housingDao.updatePhousing(sqlSession,hp);
	}

	@Override
	public int insertPReply(HousingPReply r) {
		// TODO Auto-generated method stub
		return housingDao.insertPReply(sqlSession,r);
	}

	@Override
	public ArrayList<HousingPReply> selectPReplyList(int hpno) {
		// TODO Auto-generated method stub
		return housingDao.selectPReplyList(sqlSession, hpno);
		}
    //---- top 리스트
	@Override
	public ArrayList<Housing> selectTopList() {
		return housingDao.selectTopList(sqlSession);
	}

	@Override
	public ArrayList<HousingP> selectPTopList() {
		// TODO Auto-generated method stub
		return housingDao.selectPTopList(sqlSession);
	}

	@Override
	public int selectListCount(HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return housingDao.selectListCount(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<Housing> selectList(PageInfo pageInfo, HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return housingDao.selectList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public int selectPListCount(HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return housingDao.selectPListCount(sqlSession, searchCondition);
	}

	@Override
	public ArrayList<HousingP> selectPList(PageInfo pageInfo, HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return housingDao.selectPList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public ArrayList<Housing> selectOneTopList() {
		// TODO Auto-generated method stub
		return housingDao.selectOneTopList(sqlSession);
	}





	
}
