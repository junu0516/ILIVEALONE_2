package com.kh.ila.board.model.service;

import java.util.ArrayList;

import com.kh.ila.board.model.vo.Board;
import com.kh.ila.board.model.vo.BoardSearchCondition;
import com.kh.ila.board.model.vo.BoradReply;
import com.kh.ila.board.model.vo.Fashion;
import com.kh.ila.board.model.vo.FashionReply;
import com.kh.ila.board.model.vo.PageInfo;

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

	int deleteFBoard(int fno);

	int updateFBoard(Fashion f);

	int insertFReply(FashionReply r);

	ArrayList<FashionReply> selectFReplyList(int fno);

	ArrayList<Board> selectTopList();

	ArrayList<Fashion> selectFTopList();

	int selectListCount(BoardSearchCondition searchCondition);

	ArrayList<Board> selectList(PageInfo pageInfo, BoardSearchCondition searchCondition);

	int selectFListCount(BoardSearchCondition searchCondition);

	ArrayList<Fashion> selectFList(PageInfo pageInfo, BoardSearchCondition searchCondition);

	ArrayList<Board> selectOneTopList();





}
