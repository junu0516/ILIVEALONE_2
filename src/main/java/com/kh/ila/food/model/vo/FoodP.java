package com.kh.ila.food.model.vo;
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
public class FoodP {
	
	private int foodPNo;
	private String foodPWriter;
	private String foodPTitle;
	private String foodPContent;
	private String foodPOriginName;
	private String foodPChangeName;
	private int foodPCount;
	private Date foodPCreateDate;
	private String foodPStatus;
	

}
