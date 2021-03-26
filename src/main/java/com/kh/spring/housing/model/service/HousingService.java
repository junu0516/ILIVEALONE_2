package com.kh.spring.housing.model.service;

import java.util.ArrayList;

import com.kh.spring.housing.model.vo.Housing;
import com.kh.spring.housing.model.vo.PageInfo;
import com.kh.spring.housing.model.vo.HousingSearchCondition;
import com.kh.spring.housing.model.vo.HousingReply;
import com.kh.spring.housing.model.vo.HousingP;
import com.kh.spring.housing.model.vo.HousingPReply;

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





}
