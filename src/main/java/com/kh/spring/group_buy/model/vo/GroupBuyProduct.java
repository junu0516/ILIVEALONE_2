package com.kh.spring.group_buy.model.vo;

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
public class GroupBuyProduct {
	
	private int pNo; //물품 번호
	private String pName; //물품명
	private int pPrice; //물품 가격
	private int pPurchase; //구매 인원
	private int pLimit; //제한 인원
	private int pMaxPurchase; //인당 최대 구매수량
	private Date pDate; //등록일
	private int pCno; //게시글 번호
	private String pStatus; //판매 상태
	private String pAccount; //입금계좌
}
