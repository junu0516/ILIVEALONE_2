package com.kh.spring.housing.model.vo;
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
public class Housing {
	
	private int housingNo;
	private String housingWriter;
	private String housingTitle;
	private String housingContent;
	private String originName;
	private String changeName;
	private int count;
	private Date createDate;
	private String status;
	

}
