package com.kh.spring.group_buy.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.common.paging.PageInfo;
import com.kh.spring.group_buy.model.vo.GroupBuyBoard;
import com.kh.spring.group_buy.model.vo.GroupBuyProduct;
import com.kh.spring.group_buy.model.vo.PurchaseHistory;
import com.kh.spring.group_buy.model.vo.SearchCondition;

public interface GroupBuyService {

	ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo);

	GroupBuyBoard selectBoard(int gbNo);

	ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo);

	GroupBuyProduct selectProduct(int gbNo);
	
	GroupBuyProduct selectProductWithPno(int pNo);
	
	int insertBoardAndProduct(GroupBuyBoard groupBuyBoard, GroupBuyProduct groupBuyProduct);

	int selectListCount();

	int selectListCount(SearchCondition searchCondition);

	ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo, SearchCondition searchCondition);

	ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo, SearchCondition searchCondition);

	int updateBoardAndProduct(GroupBuyBoard groupBuyBoard, GroupBuyProduct groupBuyProduct);

	int deleteBoard(int gbNo);

	ArrayList<PurchaseHistory> selectSalesHistories(String sellerId, PageInfo pageInfo);
	
	ArrayList<PurchaseHistory> selectSalesHistories(String userId, String keyword, PageInfo pageInfo);

	ArrayList<PurchaseHistory> selectPurchaseHistories(String buyerId, PageInfo pageInfo);

	int updateClosingDeal(int pNo);

	int updatePreparingDeal(HashMap<String, String> mapKey);

	int updateCompletingDeal(HashMap<String, String> mapKey);

	int updateCancelingDeal(HashMap<String, String> mapKey);

	int selectPreviousPurchaseCount(HashMap<String, String> mapKey);

	int updateDeal(PurchaseHistory purchaseHistory) throws Exception;

	int selectSalesHistoryListCount(String sellerId);

	int selectSalesHistoryListCount(String keyword, String userId);

	int selectPurchaseHistoryListCount(String userId);


}
