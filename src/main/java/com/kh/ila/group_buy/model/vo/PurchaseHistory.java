package com.kh.ila.group_buy.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PurchaseHistory {
	
	private int phNo; //구매내역 번호
	private int phProduct; //구매 물품
	private String phProductName; //물품명
	private int phQuantity; //구매수량
	private int phCno; //구매게시글 번호
	private String phBuyerName; //구매자 이름(받는사람 이름)
	private String phBuyer; //구매자 아이디
	private String phSeller; //판매자 아이디
	private Date phRecordDate; //구매일자
	private Date phChangeDate; //수정일자
	private String phAddress; //구매자 주소
	private String phStatus; //거래 상태(Y: 진행 , N: 취소)
	private String phSalesStatus; //판매상태(W : 발송 대기/R : 발송 준비/C: 발송 완료)
	private String phInvoice;//송장번호
	private String phAccount;//입금계좌
	
}
