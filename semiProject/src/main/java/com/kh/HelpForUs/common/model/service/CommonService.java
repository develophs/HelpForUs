package com.kh.HelpForUs.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;

public interface CommonService {

	ArrayList<Integer> countRose();

	int countApp();

	ArrayList<Board> latestBoard();

	ArrayList<Attachment> selectAttm();

	ArrayList<Board> seletNot5();

	ArrayList<Board> selectNotBoardList(PageInfo pi, HashMap<String, Object> map);

	int getNListCount();

	Board selectnotBoard(int bId, boolean yn);

}
