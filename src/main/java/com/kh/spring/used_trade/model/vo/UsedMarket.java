package com.kh.spring.used_trade.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UsedMarket {
	private int um_No;
	private String um_Title;
	private String um_Content;
	private String um_Writer;
	private int um_Price;
	private String um_Category; //상품 종류
	private String um_System; //상품거래방식
	private String um_Status;
	private String originName;
	private String changeName;
	
	
}
