package com.kh.spring.group_buy.model;

import com.kh.spring.group_buy.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(currentPage,listCount,startPage,endPage,maxPage,pageLimit,boardLimit);
		
		return pageInfo;
	}
}
