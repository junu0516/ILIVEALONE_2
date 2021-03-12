package com.kh.spring.used_trade.model.service;

import java.util.ArrayList;

import com.kh.spring.used_trade.model.vo.PageInfo;
import com.kh.spring.used_trade.model.vo.UsedMarket;

public interface UsedMarketService {

	

	int insertUsedMarket(UsedMarket u);

	int selectListCount();

	ArrayList<UsedMarket> selectList(PageInfo pi);

	int updateIncreaseCount(int uno);

	UsedMarket selectUsedMarket(int uno);

	int updateUsedMarket(UsedMarket u);

	int deleteUsedMarket(int uno);

	ArrayList<UsedMarket> selectListCategory(PageInfo pi, String category);


}
