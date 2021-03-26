package com.kh.spring.housing.model.vo;

import java.sql.Timestamp;

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
public class HousingReply {
	private int replyNo;
	private int refHousingNo;
	private String replyWriter;
	private String replyContent;
	//private Date createDate;
	private Timestamp createDate;
	private String status;
}
