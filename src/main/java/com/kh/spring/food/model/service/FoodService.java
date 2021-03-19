package com.kh.spring.food.model.service;

import java.util.ArrayList;

import com.kh.spring.food.model.vo.Food;
import com.kh.spring.food.model.vo.PageInfo;
import com.kh.spring.food.model.vo.FoodSearchCondition;
import com.kh.spring.food.model.vo.FoodReply;
import com.kh.spring.food.model.vo.FoodP;
import com.kh.spring.food.model.vo.FoodPReply;

public interface FoodService {

	int selectListCount();

	ArrayList<Food> selectList(PageInfo pi);

	int insertfood(Food fd);

	int updateIncreaseCount(int fdno);

	Food selectfood(int fdno);

	int deletefood(int fdno);

	int updatefood(Food fd);

	int insertReply(FoodReply r);

	ArrayList<FoodReply> selectReplyList(int fdno);

	int selectPListCount();

	ArrayList<FoodP> selectPList(PageInfo pi);

	int insertPfood(FoodP fdp);

	int updatePIncreaseCount(int fdpno);

	FoodP selectPfood(int fdpno);

	int deletePfood(int fdpno);

	int updatePfood(FoodP fdp);

	int insertPReply(FoodPReply r);

	ArrayList<FoodPReply> selectPReplyList(int fdpno);

	ArrayList<Food> selectTopList();

	ArrayList<FoodP> selectPTopList();

	int selectListCount(FoodSearchCondition searchCondition);

	ArrayList<Food> selectList(PageInfo pageInfo, FoodSearchCondition searchCondition);

	int selectPListCount(FoodSearchCondition searchCondition);

	ArrayList<FoodP> selectPList(PageInfo pageInfo, FoodSearchCondition searchCondition);





}
