package com.kh.ila.housing.model.service;

import java.util.ArrayList;

import com.kh.ila.common.paging.PageInfo;
import com.kh.ila.housing.model.vo.Housing;
import com.kh.ila.housing.model.vo.HousingP;
import com.kh.ila.housing.model.vo.HousingPReply;
import com.kh.ila.housing.model.vo.HousingReply;
import com.kh.ila.housing.model.vo.HousingSearchCondition;

public interface HousingService {

	int selectListCount();

	ArrayList<Housing> selectList(PageInfo pi);

	int inserthousing(Housing h);

	int updateIncreaseCount(int hno);

	Housing selecthousing(int hno);

	int deletehousing(int hno);

	int updatehousing(Housing h);

	int insertReply(HousingReply r);

	ArrayList<HousingReply> selectReplyList(int hno);

	int selectPListCount();

	ArrayList<HousingP> selectPList(PageInfo pi);

	int insertPhousing(HousingP hp);

	int updatePIncreaseCount(int hpno);

	HousingP selectPhousing(int hpno);

	int deletePhousing(int hpno);

	int updatePhousing(HousingP hp);

	int insertPReply(HousingPReply r);

	ArrayList<HousingPReply> selectPReplyList(int hpno);

	ArrayList<Housing> selectTopList();

	ArrayList<HousingP> selectPTopList();

	int selectListCount(HousingSearchCondition searchCondition);

	ArrayList<Housing> selectList(PageInfo pageInfo, HousingSearchCondition searchCondition);

	int selectPListCount(HousingSearchCondition searchCondition);

	ArrayList<HousingP> selectPList(PageInfo pageInfo, HousingSearchCondition searchCondition);

	ArrayList<Housing> selectOneTopList();





}
