package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.BoradReply;
import com.kh.spring.board.model.vo.Fashion;

public interface BoardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

	int updateIncreaseCount(int bno);

	Board selectBoard(int bno);

	int deleteBoard(int bno);

	int updateBoard(Board b);

	int insertReply(BoradReply r);

	ArrayList<BoradReply> selectReplyList(int bno);

	int selectFListCount();

	ArrayList<Fashion> selectFList(PageInfo pi);

	int insertFBoard(Fashion f);

	int updateFIncreaseCount(int fno);

	Fashion selectFBoard(int fno);

}
