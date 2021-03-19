package com.kh.spring.board.model.vo;
import java.sql.Date;

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
public class Fashion {
	
	private int fashionNo;
	private String fashionWriter;
	private String fashionTitle;
	private String fashionContent;
	private String fashionOriginName;
	private String fashionChangeName;
	private int fashionCount;
	private Date fashionCreateDate;
	private String fashionStatus;
	

}
