package com.kh.ila.real_estimate.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ila.real_estimate.model.vo.Real;
import com.kh.ila.real_estimate.model.vo.RealWish;

public interface RealService {

	int selectListCount();

	ArrayList<Real> selectList();

	Real selectReal(int rno);

	int insertReal(Real real);

	int deleteReal(int rno);

	int updateReal(Real r);

	int insertWish(RealWish realWish);

	int deleteStuffWish(int rno);

	ArrayList<Integer> selectWishList(String userId);

	ArrayList<Real> selectRealList(ArrayList<Integer> list);

	int deleteWish(HashMap<String, String> mapKey);


}
