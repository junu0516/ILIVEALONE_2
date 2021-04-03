package com.kh.spring.ckeditor.vo;

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
public class CKImage {
	
	public int function; //속해있는 기능번호
	public int boardNo; //기능 내에 속한 게시글 번호
	public String changeName; //수정된 파일명
	public String originalName; //원 파일명
}
