package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import com.kh.spring.notice.model.vo.PageInfo;
import com.kh.spring.notice.model.vo.Notice;


public interface NoticeService {

	int selectListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int insertNotice(Notice n);

	int updateIncreaseCount(int nno);

	Notice selectNotice(int nno);

	int deleteNotice(int nno);

	int updateNotice(Notice n);


}
