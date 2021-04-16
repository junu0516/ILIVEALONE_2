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
public class GroupBuyBoard {
	
	private int gbNo;
	private String gbMno;
	private String gbTitle;
	private String gbContent;
	private Date gbDate;
	private int gbCount;
	private String gbStatus;
	private String gbOriginalName;
	private String gbChangedName;
	
}
