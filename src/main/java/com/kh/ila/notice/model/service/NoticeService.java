package com.kh.ila.notice.model.service;

import java.util.ArrayList;

import com.kh.ila.common.paging.PageInfo;
import com.kh.ila.notice.model.vo.Notice;


public interface NoticeService {

	int selectListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int insertNotice(Notice n);

	int updateIncreaseCount(int nno);

	Notice selectNotice(int nno);

	int deleteNotice(int nno);

	int updateNotice(Notice n);


}
