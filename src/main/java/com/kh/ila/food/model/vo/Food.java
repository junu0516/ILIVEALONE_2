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
public class Food {
	
	private int foodNo;
	private String foodWriter;
	private String foodTitle;
	private String foodContent;
	private String originName;
	private String changeName;
	private int count;
	private Date createDate;
	private String status;
	

}
