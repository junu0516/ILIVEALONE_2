package com.kh.spring.group_buy.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.group_buy.model.vo.GroupBuyBoard;
import com.kh.spring.group_buy.model.vo.GroupBuyProduct;
import com.kh.spring.group_buy.model.vo.PageInfo;
import com.kh.spring.group_buy.model.vo.PurchaseHistory;
import com.kh.spring.group_buy.model.vo.SearchCondition;

public interface GroupBuyService {

	int insertBoard(GroupBuyBoard groupBuyBoard);

	ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo);

	GroupBuyBoard selectBoard(int gbNo);

	int insertProduct(GroupBuyProduct groupBuyProduct);

	int getLastBoardNum();

	ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo);

	GroupBuyProduct selectProduct(int gbNo);
	
	GroupBuyProduct selectProductWithPno(int pNo);

	int selectListCount();

	int selectListCount(SearchCondition searchCondition);

	ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo, SearchCondition searchCondition);

	ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo, SearchCondition searchCondition);

	int updateBoard(GroupBuyBoard groupBuyBoard);

	int updateProduct(GroupBuyProduct groupBuyProduct);

	int deleteBoard(int gbNo);

	int addPurchaseHistory(PurchaseHistory purchaseHistory);

	int updatePurchase(int pNo);

	ArrayList<PurchaseHistory> selectSalesHistories(String sellerId);

	ArrayList<PurchaseHistory> selectPurchaseHistories(String buyerId);

	int closeDeal(int pNo);

	int prepareDeal(HashMap<String, String> mapKey);

	int completeDeal(HashMap<String, String> mapKey);

	int cancelDeal(HashMap<String, String> mapKey);

	int decreasePurchaseCount(int pNo);

	int reopenDeal(int pNo);
}
