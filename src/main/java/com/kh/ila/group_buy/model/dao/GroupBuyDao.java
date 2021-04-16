package com.kh.ila.group_buy.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.common.paging.PageInfo;
import com.kh.ila.group_buy.model.vo.GroupBuyBoard;
import com.kh.ila.group_buy.model.vo.GroupBuyProduct;
import com.kh.ila.group_buy.model.vo.PurchaseHistory;
import com.kh.ila.group_buy.model.vo.SearchCondition;

@Repository
public class GroupBuyDao {

	public int insertBoard(SqlSessionTemplate sqlSession, GroupBuyBoard groupBuyBoard) {
	
		return sqlSession.insert("groupBuyMapper.insertBoard",groupBuyBoard);
	}

	public ArrayList<GroupBuyBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectList",null,rowBounds);
	}

	public GroupBuyBoard selectBoard(SqlSessionTemplate sqlSession, int gbNo) {
	
		return sqlSession.selectOne("groupBuyMapper.selectBoard",gbNo);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, GroupBuyProduct groupBuyProduct) {
	
		return sqlSession.insert("groupBuyMapper.insertProduct",groupBuyProduct);
	}

	public int getLastBoardNum(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("groupBuyMapper.selectLastBoardNum",null);
	}

	public ArrayList<GroupBuyProduct> selectProducts(SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectProducts",null,rowBounds);
	}

	public GroupBuyProduct selectProduct(SqlSessionTemplate sqlSession, int gbNo) {
	
		return sqlSession.selectOne("groupBuyMapper.selectProduct",gbNo);
	}
	
	public GroupBuyProduct selectProductWithPno(SqlSessionTemplate sqlSession, int pNo) {
	
		return sqlSession.selectOne("groupBuyMapper.selectProductWithPno",pNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("groupBuyMapper.selectListCount");
	}

	public int selectListCount(SqlSessionTemplate sqlSession, SearchCondition searchCondition) {
	
		return sqlSession.selectOne("groupBuyMapper.selectSearchListCount",searchCondition);
	}

	public ArrayList<GroupBuyBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			SearchCondition searchCondition) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectSearchList",searchCondition,rowBounds);
	}

	public ArrayList<GroupBuyProduct> selectProducts(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			SearchCondition searchCondition) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectSearchProducts",searchCondition,rowBounds);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, GroupBuyBoard groupBuyBoard) {
		
		return sqlSession.update("groupBuyMapper.updateBoard",groupBuyBoard);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, GroupBuyProduct groupBuyProduct) {
		
		return sqlSession.update("groupBuyMapper.updateProduct",groupBuyProduct);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int gbNo) {
	
		return sqlSession.update("groupBuyMapper.deleteBoard",gbNo);
	}

	public int insertPurchaseHistory(SqlSessionTemplate sqlSession, PurchaseHistory purchaseHistory) {
		
		return sqlSession.insert("groupBuyMapper.insertPurchaseHistory",purchaseHistory);
	}

	public int updatePurchase(SqlSessionTemplate sqlSession, int pNo) {
	
		return sqlSession.update("groupBuyMapper.updatePurchase",pNo);
	}
	
	public ArrayList<PurchaseHistory> selectSalesHistories(SqlSessionTemplate sqlSession, String sellerId, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectSalesHistories",sellerId,rowBounds);
	}
	
	public ArrayList<PurchaseHistory> selectSalesHistories(SqlSessionTemplate sqlSession, String sellerId,
			String keyword, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		HashMap<String,Object> mapKey = new HashMap<>();
		mapKey.put("sellerId", sellerId);
		mapKey.put("keyword", keyword);
		System.out.println(mapKey);
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectSalesHistoriesWithKeyword",mapKey,rowBounds);
	}

	public ArrayList<PurchaseHistory> selectPurchaseHistories(SqlSessionTemplate sqlSession, String buyerId, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectPurchaseHistories",buyerId, rowBounds);
	}

	public int updateClosingDeal(SqlSessionTemplate sqlSession, int pNo) {

		return sqlSession.update("groupBuyMapper.closeDeal",pNo);
	}

	public int updatePreparingDeal(SqlSessionTemplate sqlSession, HashMap<String, String> mapKey) {

		return sqlSession.update("groupBuyMapper.prepareDeal",mapKey);
	}

	public int updateCompletingDeal(SqlSessionTemplate sqlSession, HashMap<String, String> mapKey) {
		
		return sqlSession.update("groupBuyMapper.completeDeal",mapKey);
	}

	public int updateCancelingDeal(SqlSessionTemplate sqlSession, HashMap<String, String> mapKey) {
	
		return sqlSession.update("groupBuyMapper.cancelDeal",mapKey);
	}

	public int decreasePurchaseCount(SqlSessionTemplate sqlSession, int pNo) {
	
		return sqlSession.update("groupBuyMapper.decreasePurchaseCount",pNo);
	}

	public int updateReopeningDeal(SqlSessionTemplate sqlSession, int pNo) {

		return sqlSession.update("groupBuyMapper.reopenDeal",pNo);
	}

	public int selectPreviousPurchaseCount(SqlSessionTemplate sqlSession, HashMap<String, String> mapKey) {

		return sqlSession.selectOne("groupBuyMapper.selectPreviousPurchaseCount",mapKey);
	}

	public int selectSalesHistoryListCount(SqlSessionTemplate sqlSession, String sellerId) {
	
		return sqlSession.selectOne("groupBuyMapper.selectSalesHistoryListCount",sellerId);
	}

	public int selectSalesHistoryListCount(SqlSessionTemplate sqlSession, String keyword, String sellerId) {
		
		HashMap<String,Object> mapKey = new HashMap<>();
		mapKey.put("sellerId", sellerId);
		mapKey.put("keyword", keyword);
		
		return sqlSession.selectOne("groupBuyMapper.selectSalesHistoryListWithKeyword",mapKey);
	}

	public int selectPurchaseHistoryListCount(SqlSessionTemplate sqlSession, String buyerId) {
		
		return sqlSession.selectOne("groupBuyMapper.selectPurchaseHistoryListCount",buyerId);
	}

	
}
