package com.kh.spring.notice.model.vo;
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
public class Notice {
	
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private String originName;
	private String changeName;
	private int count;
	private Date createDate;
	private String status;
	
}
