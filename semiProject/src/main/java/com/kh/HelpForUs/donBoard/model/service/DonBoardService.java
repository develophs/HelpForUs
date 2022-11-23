package com.kh.HelpForUs.donBoard.model.service;

import java.util.ArrayList;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.volBoard.model.vo.Application;

public interface DonBoardService {

	int getDonListCount(int i);

	ArrayList<DonBoard> selectDonList(PageInfo pi, int cate);

	int insertDonBoard(DonBoard dB);

	int insertAttm(Attachment a);

	ArrayList<Attachment> selectAttmList();

	int insertImg(int i);

	DonBoard selectDonBoard(int bId);

	ArrayList<Attachment> selectDonAttm(int bId);




}
