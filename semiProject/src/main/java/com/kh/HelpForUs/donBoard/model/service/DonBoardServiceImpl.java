package com.kh.HelpForUs.donBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.dao.DonBoardDAO;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;

@Service("dService")
public class DonBoardServiceImpl implements DonBoardService{

	@Autowired
	private DonBoardDAO dDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getDonListCount(int i) {
		return dDAO.getDonListCount(sqlSession, i);
	}

	@Override
	public ArrayList<DonBoard> selectDonList(PageInfo pi, int cate) {
		return dDAO.selectDonList(sqlSession, pi, cate);
	}

	@Override
	public int insertDonBoard(DonBoard dB) {
		return dDAO.insertDonBoard(sqlSession, dB);
	}

	@Override
	public int insertAttm(Attachment a) {
		return dDAO.insertAttm(sqlSession, a);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return dDAO.selectAttmList(sqlSession);
	}

	@Override
	public int insertImg(int i) {
		return dDAO.insertImg(sqlSession, i);
	}

	@Override
	public DonBoard selectDonBoard(int bId, boolean bool) {
		if(bool) {
			dDAO.donBoardCount(sqlSession, bId);
		}
		return dDAO.selectDonBoard(sqlSession, bId);
		
	}

	@Override
	public ArrayList<Attachment> selectDonAttm(int bId) {
		return dDAO.selectDonAttm(sqlSession, bId);
	}

	@Override
	public Cheer cheer(Cheer c) {
		return dDAO.cheer(sqlSession, c);
	}

	@Override
	public int cheerUp(Cheer cheerUp) {
		return dDAO.cheerUp(sqlSession, cheerUp);
	}

	@Override
	public int cheerCancle(Cheer cheerUp) {
		return dDAO.cheerCancle(sqlSession, cheerUp);
	}


}
