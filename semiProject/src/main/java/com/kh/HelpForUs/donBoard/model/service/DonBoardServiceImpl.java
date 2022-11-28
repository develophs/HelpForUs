package com.kh.HelpForUs.donBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.Image;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Reply;
import com.kh.HelpForUs.donBoard.model.dao.DonBoardDAO;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.vo.Donation;
import com.kh.HelpForUs.member.model.vo.Member;

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
	public ArrayList<DonBoard> selectDonList(PageInfo pi, HashMap<String, Object> map) {
		return dDAO.selectDonList(sqlSession, pi, map);
	}

	@Override
	public int insertDonBoard(DonBoard dB) {
		return dDAO.insertDonBoard(sqlSession, dB);
	}

	@Override
	public int insertAttm(HashMap<String, Object> map) {
		return dDAO.insertAttm(sqlSession, map);
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

	@Override
	public int roseDonation(Member m) {
		return dDAO.roseDonation(sqlSession, m);
	}

	@Override
	public int breakdownDon(Donation don) {
		return dDAO.breakdownDon(sqlSession, don);
	}

	@Override
	public int replyInsert(Reply r) {
		return dDAO.replyInsert(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReply(Reply r) {
		return dDAO.selectReply(sqlSession, r);
	}

	@Override
	public int deleteDonBoard(int bId) {
		return dDAO.deleteDonBoard(sqlSession, bId);
	}

	@Override
	public int updateDonBoard(DonBoard dB) {
		return dDAO.updateDonBoard(sqlSession, dB);
	}

	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return dDAO.deleteAttm(sqlSession, delRename);
	}

	@Override
	public void updateAttmLevel(int boardId) {
		dDAO.updateAttmLevel(sqlSession, boardId);
	}

	@Override
	public void deleteImage(Image img) {
		dDAO.deleteImage(sqlSession, img);
		
	}

	@Override
	public int deleteAttmStatus(int bId) {
		return dDAO.deleteAttmStatus(sqlSession, bId);
	}

	@Override
	public int fundraisingUpdate(DonBoard dFund) {
		return dDAO.fundraisingUpdate(sqlSession, dFund);
	}

	@Override
	public int selectCurrRose(String id) {
		return dDAO.selectCurrRose(sqlSession, id);
	}






}
