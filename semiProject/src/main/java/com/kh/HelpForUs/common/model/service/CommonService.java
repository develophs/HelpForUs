package com.kh.HelpForUs.common.model.service;

import java.util.ArrayList;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;

public interface CommonService {

	ArrayList<Integer> countRose();

	int countApp();

	ArrayList<Board> latestBoard();

	ArrayList<Attachment> selectAttm();

	ArrayList<Board> seletNot5();

}
