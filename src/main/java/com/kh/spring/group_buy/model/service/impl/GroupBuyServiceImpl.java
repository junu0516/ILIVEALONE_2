package com.kh.spring.group_buy.model.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.group_buy.model.dao.GroupBuyDao;
import com.kh.spring.group_buy.model.service.GroupBuyService;
import com.kh.spring.group_buy.model.vo.GroupBuyBoard;
import com.kh.spring.group_buy.model.vo.GroupBuyProduct;
import com.kh.spring.group_buy.model.vo.PageInfo;
import com.kh.spring.group_buy.model.vo.PurchaseHistory;
import com.kh.spring.group_buy.model.vo.SearchCondition;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private GroupBuyDao groupBuyDao;
	
	@Override
	public int insertBoard(GroupBuyBoard groupBuyBoard) {
		
		return groupBuyDao.insertBoard(sqlSession,groupBuyBoard);
	}

	@Override
	public ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo) {
		
		return groupBuyDao.selectList(sqlSession,pageInfo);
	}

	@Override
	public GroupBuyBoard selectBoard(int gbNo) {
		
		return groupBuyDao.selectBoard(sqlSession,gbNo);
	}

	@Override
	public int insertProduct(GroupBuyProduct groupBuyProduct) {

		return groupBuyDao.insertProduct(sqlSession,groupBuyProduct);
	}

	@Override
	public int getLastBoardNum() {
		
		return groupBuyDao.getLastBoardNum(sqlSession);
	}

	@Override
	public ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo) {
		
		return groupBuyDao.selectProducts(sqlSession,pageInfo);
	}

	@Override
	public GroupBuyProduct selectProduct(int gbNo) {
		
		return groupBuyDao.selectProduct(sqlSession,gbNo);
	}
	
	@Override
	public GroupBuyProduct selectProductWithPno(int pNo) {

		return groupBuyDao.selectProductWithPno(sqlSession, pNo);
	}

	@Override
	public int selectListCount() {
		
		return groupBuyDao.selectListCount(sqlSession);
	}

	@Override
	public int selectListCount(SearchCondition searchCondition) {
	
		return groupBuyDao.selectListCount(sqlSession,searchCondition);
	}

	@Override
	public ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo, SearchCondition searchCondition) {
	
		return groupBuyDao.selectList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo, SearchCondition searchCondition) {
		
		return groupBuyDao.selectProducts(sqlSession, pageInfo, searchCondition);
	}

	@Override
	public int updateBoard(GroupBuyBoard groupBuyBoard) {
		
		return groupBuyDao.updateBoard(sqlSession,groupBuyBoard);
	}

	@Override
	public int updateProduct(GroupBuyProduct groupBuyProduct) {
		
		return groupBuyDao.updateProduct(sqlSession,groupBuyProduct);
	}

	@Override
	public int deleteBoard(int gbNo) {
		
		return groupBuyDao.deleteBoard(sqlSession,gbNo);
	}

	@Override
	public int addPurchaseHistory(PurchaseHistory purchaseHistory) {
	
		return groupBuyDao.addPurchaseHistory(sqlSession,purchaseHistory);
	}

	@Override
	public int updatePurchase(int pNo) {
		
		return groupBuyDao.updatePurchase(sqlSession, pNo);
	}

	@Override
	public int updatePurchaseWithoutAccumulation(int pNo) {
	
		return groupBuyDao.updatePurchaseWithoutAccumulation(sqlSession,pNo);
	}
	
	@Override
	public ArrayList<PurchaseHistory> selectSalesHistories(String sellerId) {
		
		return groupBuyDao.selectSalesHistories(sqlSession,sellerId);
	}

	@Override
	public ArrayList<PurchaseHistory> selectPurchaseHistories(String buyerId) {

		return groupBuyDao.selectPurchaseHistories(sqlSession,buyerId);
	}

	@Override
	public int closeDeal(int pNo) {
		
		return groupBuyDao.closeDeal(sqlSession,pNo);
	}

	@Override
	public int prepareDeal(HashMap<String, String> mapKey) {
	
		return groupBuyDao.prepareDeal(sqlSession,mapKey);
	}

	@Override
	public int completeDeal(HashMap<String, String> mapKey) {

		return groupBuyDao.completeDeal(sqlSession,mapKey);
	}

	@Override
	public int cancelDeal(HashMap<String, String> mapKey) {
	
		return groupBuyDao.cancelDeal(sqlSession,mapKey);
	}

	@Override
	public int decreasePurchaseCount(int pNo) {

		return groupBuyDao.decreasePurchaseCount(sqlSession,pNo);
	}

	@Override
	public int reopenDeal(int pNo) {
		
		return groupBuyDao.reopenDeal(sqlSession,pNo);
	}

	@Override
	public int selectPreviousPurchaseCount(HashMap<String, String> mapKey) {
	
		return groupBuyDao.selectPreviousPurchaseCount(sqlSession,mapKey);
	}

}
