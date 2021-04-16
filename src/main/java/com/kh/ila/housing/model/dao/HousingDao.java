package com.kh.ila.housing.model.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ila.housing.model.vo.Housing;
import com.kh.ila.housing.model.vo.HousingP;
import com.kh.ila.housing.model.vo.HousingPReply;
import com.kh.ila.housing.model.vo.HousingReply;
import com.kh.ila.housing.model.vo.HousingSearchCondition;
import com.kh.ila.housing.model.vo.PageInfo;


@Repository("housingDao")
public class HousingDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("housingMapper.selectListCount");
		}

	public ArrayList<Housing> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getHousingLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getHousingLimit());
		return (ArrayList)sqlSession.selectList("housingMapper.selectList", null, rowBounds);

	}
	public int inserthousing(SqlSessionTemplate sqlSession, Housing h) {
		return sqlSession.insert("housingMapper.inserthousing",h);
	}

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.update("housingMapper.updateIncreaseCount",hno);
	}

	public Housing selecthousing(SqlSessionTemplate sqlSession, int hno) {
		return sqlSession.selectOne("housingMapper.selecthousing",hno);
	}

	public int deletehousing(SqlSessionTemplate sqlSession, int hno) {
		// TODO Auto-generated method stub
		return sqlSession.update("housingMapper.deletehousing",hno);
	}

	public int updatehousing(SqlSessionTemplate sqlSession, Housing h) {
		// TODO Auto-generated method stub
		return sqlSession.update("housingMapper.updatehousing",h);
	}

	public int insertReply(SqlSessionTemplate sqlSession, HousingReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("housingMapper.insertReply",r);
	}

	public ArrayList<HousingReply> selectReplyList(SqlSessionTemplate sqlSession, int hno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("housingMapper.selectReplyList", hno);
	}

	// --------------------------------------------------------
	// 패션 사진 게시판 
	public int selectPListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("housingMapper.selectPListCount");
	}

	public ArrayList<HousingP> selectPList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) *pi.getHousingLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getHousingLimit());
		return (ArrayList)sqlSession.selectList("housingMapper.selectPList", null, rowBounds);

	}

	public int insertPhousing(SqlSessionTemplate sqlSession, HousingP hp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("housingMapper.insertPhousing",hp);
	}

	public int updatePIncreaseCount(SqlSessionTemplate sqlSession, int hpno) {
		// TODO Auto-generated method stub
		return sqlSession.update("housingMapper.updatePIncreaseCount",hpno);
	}

	public HousingP selectPhousing(SqlSessionTemplate sqlSession, int hpno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("housingMapper.selectPhousing",hpno);
	}

	public int deletePhousing(SqlSessionTemplate sqlSession, int hpno) {
		// TODO Auto-generated method stub
		return sqlSession.update("housingMapper.deletePhousing",hpno);
	}

	public int updatePhousing(SqlSessionTemplate sqlSession, HousingP hp) {
		// TODO Auto-generated method stub
		return sqlSession.update("housingMapper.updatePhousing",hp);
	}

	public int insertPReply(SqlSessionTemplate sqlSession, HousingPReply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("housingMapper.insertPReply",r);
	}

	public ArrayList<HousingPReply> selectPReplyList(SqlSessionTemplate sqlSession, int hpno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("housingMapper.selectPReplyList", hpno);
	}
	
	// 패션 top 리스트 
	public ArrayList<Housing> selectTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("housingMapper.selectTopList");	
	}

	public ArrayList<HousingP> selectPTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("housingMapper.selectPTopList");	
	}

	public int selectListCount(SqlSessionTemplate sqlSession, HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("housingMapper.selectSearchListCount", searchCondition);
	}

	public ArrayList<Housing> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		int offset = (pageInfo.getCurrentPage()-1) *pageInfo.getHousingLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getHousingLimit());
		return (ArrayList)sqlSession.selectList("housingMapper.selectSearchList", searchCondition, rowBounds);
	}

	public int selectPListCount(SqlSessionTemplate sqlSession, HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("housingMapper.selectSearchPListCount", searchCondition);
	}

	public ArrayList<HousingP> selectPList(SqlSessionTemplate sqlSession, PageInfo pageInfo,
			HousingSearchCondition searchCondition) {
		// TODO Auto-generated method stub
		int offset = (pageInfo.getCurrentPage()-1) *pageInfo.getHousingLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getHousingLimit());
		return (ArrayList)sqlSession.selectList("housingMapper.selectSearchPList", searchCondition, rowBounds);

	}

	public ArrayList<Housing> selectOneTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("housingMapper.selectOneTopList");	
		}


}
