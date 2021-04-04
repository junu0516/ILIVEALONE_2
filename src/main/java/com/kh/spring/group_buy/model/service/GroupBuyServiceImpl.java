package com.kh.spring.group_buy.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.common.exception.CommonException;
import com.kh.spring.common.paging.PageInfo;
import com.kh.spring.group_buy.model.dao.GroupBuyDao;
import com.kh.spring.group_buy.model.service.GroupBuyService;
import com.kh.spring.group_buy.model.vo.GroupBuyBoard;
import com.kh.spring.group_buy.model.vo.GroupBuyProduct;
import com.kh.spring.group_buy.model.vo.PurchaseHistory;
import com.kh.spring.group_buy.model.vo.SearchCondition;

@Service
@Transactional
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GroupBuyDao groupBuyDao;

	@Override
	public ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo) {
		
		return groupBuyDao.selectList(sqlSession,pageInfo);
	}

	@Override
	public GroupBuyBoard selectBoard(int gbNo) {
		
		return groupBuyDao.selectBoard(sqlSession,gbNo);
	}
	
	@Override
	public int insertBoardAndProduct(GroupBuyBoard groupBuyBoard, GroupBuyProduct groupBuyProduct) {
		
		int result1 = groupBuyDao.insertBoard(sqlSession, groupBuyBoard);
		/*
		if(result1>0) {
			System.out.println("게시글 정보 DB등록 완료");
		}
		*/
				
		int pCno = groupBuyDao.getLastBoardNum(sqlSession);
		groupBuyProduct.setPCno(pCno);
		int result2 = groupBuyDao.insertProduct(sqlSession, groupBuyProduct);
		/*
		if(result2>0) {
			System.out.println("제품정보 DB등록 완료");
		}
		*/
		
		return result1 * result2;
	}

	@Override
	public ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo) {
		
		return groupBuyDao.selectProducts(sqlSession,pageInfo);
	}

	@Override
	public GroupBuyProduct selectProduct(int gbNo) {
		
		return groupBuyDao.selectProduct(sqlSession,gbNo);
	}
	
	@Override
	public GroupBuyProduct selectProductWithPno(int pNo) {

		return groupBuyDao.selectProductWithPno(sqlSession, pNo);
	}

	@Override
	public int selectListCount() {
		
		return groupBuyDao.selectListCount(sqlSession);
	}

	@Override
	public int selectListCount(SearchCondition searchCondition) {
	
		return groupBuyDao.selectListCount(sqlSession,searchCondition);
	}

	@Override
	public ArrayList<GroupBuyBoard> selectList(PageInfo pageInfo, SearchCondition searchCondition) {
	
		return groupBuyDao.selectList(sqlSession,pageInfo,searchCondition);
	}

	@Override
	public ArrayList<GroupBuyProduct> selectProducts(PageInfo pageInfo, SearchCondition searchCondition) {
		
		return groupBuyDao.selectProducts(sqlSession, pageInfo, searchCondition);
	}
	
	@Override
	public int updateBoardAndProduct(GroupBuyBoard groupBuyBoard, GroupBuyProduct groupBuyProduct) {
		
		int result1 = groupBuyDao.updateBoard(sqlSession, groupBuyBoard);
		
		/*if(result1>0) {
			System.out.println("게시글 업데이트 완료");
		}
		*/
		int result2 = groupBuyDao.updateProduct(sqlSession, groupBuyProduct);
		/*
		if(result2>0) {
			System.out.println("제품정보 업데이트 완료");
		}
		 */
		int result3 = groupBuyDao.insertTransactionTest(sqlSession, groupBuyProduct);
			
		return result1 * result2 * result3;
	}

	@Override
	public int deleteBoard(int gbNo) {
		
		return groupBuyDao.deleteBoard(sqlSession,gbNo);
	}

	@Override
	public ArrayList<PurchaseHistory> selectSalesHistories(String sellerId) {
		
		return groupBuyDao.selectSalesHistories(sqlSession,sellerId);
	}

	@Override
	public ArrayList<PurchaseHistory> selectPurchaseHistories(String buyerId) {

		return groupBuyDao.selectPurchaseHistories(sqlSession,buyerId);
	}
	
	@Override
	public int updateDeal(PurchaseHistory purchaseHistory) throws Exception  {
	
		/*
		 * 
		 * 1. 이전 구매기록이 있는지 확인
		 * 2. 구매기록이 없다면, 모집인원 도달여부를 먼저 확인
		 *    -> 아직 충분하면 바로 업데이트 후, 모집인원 1명 누적
		 * 3. 구매기록이 있다면, 인당 제한된 수량에 도달했는 지를 확인
		 *    -> 제한된 수량에 도달하지 않았다면 업데이트 후 모집인원 1명 누적
		 * 
		 * */
		
		//1. 이전 구매내역이 존재하는지 확인
		HashMap<String,String> mapKey = new HashMap<>();
		mapKey.put("phBuyer", purchaseHistory.getPhBuyer());
		mapKey.put("phProduct", String.valueOf(purchaseHistory.getPhProduct())); //mapKey 넘기고
		int previousPurchaseCount = groupBuyDao.selectPreviousPurchaseCount(sqlSession,mapKey); //이 부분은 서비스레이어에서 수행
		
		int result = -1;
		GroupBuyProduct gbProduct = groupBuyDao.selectProductWithPno(sqlSession,purchaseHistory.getPhProduct());
		System.out.println("해당 회원의  선택한 제품에 대한 이전까지의 총 구매수량 : "+previousPurchaseCount);
		if(previousPurchaseCount<=0) { //이전 구매기록이 없을 경우
			//모집인원 도달여부 확인
			int limit = gbProduct.getPLimit();
			int purchaseCount = gbProduct.getPPurchase();
			System.out.println("구매처리 전  : limit -> "+limit+" / count -> "+purchaseCount);
			if(purchaseCount+1>limit) {//만일 구매처리 했다고 가정하고 누적인인원+1이 제한 수량을 넘어서면 구매 불가를 리턴
				return 1;
			}
			
			//1명 누적해도 제한 수량을 넘기지 않을 경우
			//누적인원 1명 추가하여 업데이트 후 모집인원, 콘솔창으로 누적인원 확인
			result = groupBuyDao.updatePurchase(sqlSession,purchaseHistory.getPhProduct());	//이 부분 롤백되는 것 확인
			if(result>0) {
				System.out.println("누적인원 1명 추가 완료");
			}
			gbProduct = groupBuyDao.selectProductWithPno(sqlSession,purchaseHistory.getPhProduct());
			limit = gbProduct.getPLimit();
			purchaseCount = gbProduct.getPPurchase();
			System.out.println("구매처리 후 : limit -> "+limit+" / count -> "+purchaseCount);
			
			result = -1;
		}else { //이전 구매기록이 존재하는 경우
			
			//인당 제한된 수량에 도달했는 지 확인 후, 여유가 없을 경우 구매처리 없이 redirect
			if(purchaseHistory.getPhQuantity()+previousPurchaseCount>gbProduct.getPMaxPurchase()) { //아직 여유가 없는 경우
				return 2;
			}
		}
		
		//업데이트 후 모집인원이 다 차면, 판매 종료 처리
		result = -1;
		int limit = gbProduct.getPLimit(); // 제한수량
		int purchaseCount = gbProduct.getPPurchase(); // 구매 누적 인원
		if(limit<=purchaseCount) { //누적인원이 제한수량 인원 이상일 경우
			
			//제품 테이블의 PRODUCT_STATUS 속성을 N으로 변경하여, 판매 닫기 처리(UPDATE)
			result = groupBuyDao.updateClosingDeal(sqlSession,purchaseHistory.getPhProduct()); //이 부분도 예외발생 후 롤백된 것 확인
			
			if(result>0) {
				System.out.println("제한인원 도달로 판매 종료");
			}else {
				System.out.println("제한인원 도달했지만 판매 종료 처리에 실패");
			}
		} 
		
		result=-1;
		//판매종료 처리 후, 구매기록 추가(INSERT)
		result = groupBuyDao.insertPurchaseHistory(sqlSession,purchaseHistory);
		if(result>0) {
			System.out.println("구매내역 추가 완료");
		}		
		return 3;
	}
	
	@Override
	public int updateClosingDeal(int pNo) {
		
		return groupBuyDao.updateClosingDeal(sqlSession,pNo);
	}

	@Override
	public int updatePreparingDeal(HashMap<String, String> mapKey) {
	
		return groupBuyDao.updatePreparingDeal(sqlSession,mapKey);
	}

	@Override
	public int updateCompletingDeal(HashMap<String, String> mapKey) {

		return groupBuyDao.updateCompletingDeal(sqlSession,mapKey);
	}

	@Override
	public int updateCancelingDeal(HashMap<String, String> mapKey) {
		
		int result = groupBuyDao.updateCancelingDeal(sqlSession,mapKey);
		/*
		if(result>0) {
			System.out.println("취소처리 완료");
		}
		*/
		//취소 후, 동일한 구매자, 제품번호로 더 이상의 구매기록이 없을 경우에는 해당 제품 테이블의 누적인원을 1명 차감
		int previousPurchaseCount = groupBuyDao.selectPreviousPurchaseCount(sqlSession,mapKey);
		if(previousPurchaseCount<=0) {
			result=-1;
			result = groupBuyDao.decreasePurchaseCount(sqlSession,Integer.parseInt(mapKey.get("phProduct")));
			/*
			if(result>0) {
				System.out.println("count-1 처리 완료");
			}
			*/
		}
		
		//차감 후 누적인원이  제한인원보다 적어지면 판매를 다시 오픈
		result = -1;
		GroupBuyProduct groupBuyProduct = groupBuyDao.selectProductWithPno(sqlSession,Integer.parseInt(mapKey.get("phProduct")));
		if(groupBuyProduct.getPPurchase()-1<groupBuyProduct.getPLimit()) {
			result = groupBuyDao.updateReopeningDeal(sqlSession,Integer.parseInt(mapKey.get("phProduct")));
			/*
			if(result>0) {
				System.out.println("판매를 다시 재오픈");
			}
			*/
		}
		
		return groupBuyDao.updateCancelingDeal(sqlSession,mapKey);
	}

	@Override
	public int selectPreviousPurchaseCount(HashMap<String, String> mapKey) {
	
		return groupBuyDao.selectPreviousPurchaseCount(sqlSession,mapKey);
	}	

}
