package com.kh.spring.real_estimate.model.service;

import java.util.ArrayList;

import com.kh.spring.real_estimate.model.vo.PageInfo;
import com.kh.spring.real_estimate.model.vo.Real;

public interface RealService {

	int selectListCount();

	ArrayList<Real> selectList();

	Real selectReal(int rno);

	int insertReal(Real real);

	int deleteReal(int rno);

	int updateReal(Real r);


}
