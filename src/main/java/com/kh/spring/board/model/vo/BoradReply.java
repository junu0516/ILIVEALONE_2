package com.kh.spring.board.model.vo;

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
public class BoradReply {
	private int replyNo;
	private int refBoardNo;
	private String replyWriter;
	private String replyContent;
	//private Date createDate;
	private Timestamp createDate;
	private String status;
}
