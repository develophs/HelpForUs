package com.kh.HelpForUs.donBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.dao.DonBoardDAO;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.volBoard.model.vo.Application;

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
	public int insertAttm(Attachment attachment) {
		return dDAO.insertAttm(sqlSession, attachment);
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
	public DonBoard selectDonBoard(int bId) {
		return dDAO.selectDonBoard(sqlSession, bId);
	}

	@Override
	public ArrayList<Attachment> selectDonAttm(int bId) {
		return dDAO.selectDonAttm(sqlSession, bId);
	}

}
