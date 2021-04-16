package com.kh.ila.notice.model.service;

import java.util.ArrayList;

import com.kh.ila.notice.model.vo.Notice;
import com.kh.ila.notice.model.vo.PageInfo;


public interface NoticeService {

	int selectListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int insertNotice(Notice n);

	int updateIncreaseCount(int nno);

	Notice selectNotice(int nno);

	int deleteNotice(int nno);

	int updateNotice(Notice n);


}
