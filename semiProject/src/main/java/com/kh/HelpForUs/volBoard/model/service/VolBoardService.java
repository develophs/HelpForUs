package com.kh.HelpForUs.volBoard.model.service;

import java.util.ArrayList;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

public interface VolBoardService {

	int insertVolBoard(VolBoard vBoard);

	int insertAttm(Attachment a);

	int insertImg();

	int getVListCount();

	ArrayList<VolBoard> selectVolBoardList(PageInfo pi);

	ArrayList<Attachment> selectAttmList();

}
