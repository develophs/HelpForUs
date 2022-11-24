package com.kh.HelpForUs.donBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
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

	DonBoard selectDonBoard(int bId, boolean yn);

	ArrayList<Attachment> selectDonAttm(int bId);

	Cheer cheer(Cheer c);

	int cheerUp(Cheer cheerUp);

	int cheerCancle(Cheer cheerUp);





}
