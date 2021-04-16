package com.kh.ila.housing.model.vo;
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
public class HousingP {
	
	private int housingPNo;
	private String housingPWriter;
	private String housingPTitle;
	private String housingPContent;
	private String housingPOriginName;
	private String housingPChangeName;
	private int housingPCount;
	private Date housingPCreateDate;
	private String housingPStatus;
	

}
