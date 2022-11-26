package com.kh.HelpForUs.revBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.member.model.vo.Donation;
import com.kh.HelpForUs.revBoard.model.dao.RevBoardDAO;
import com.kh.HelpForUs.revBoard.model.vo.RevBoard;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Service("rService")
public class RevBoardServiceImpl implements RevBoardService{

	@Autowired
	private RevBoardDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertRevBoard(RevBoard rBoard) {
		return rDAO.insertRevBoard(sqlSession,rBoard);
	}

	@Override
	public int insertAttm(Attachment a) {
		return rDAO.insertAttm(sqlSession,a);
	}

	@Override
	public int insertImg(int i) {
		return rDAO.insertImg(sqlSession, i);
	}


	@Override
	public int getRListCount() {
		return rDAO.getRListCount(sqlSession);
	}

	@Override
	public ArrayList<VolBoard> selectVolBoardList(PageInfo pi, int category) {
		return rDAO.selectVolBoardList(sqlSession, pi, category);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return rDAO.selectAttmList(sqlSession);
	}

	@Override
	public ArrayList<Donation> selectDonor(int bId) {
		return rDAO.selectDonor(sqlSession,bId);
	}

	
	

	

	

	
	
	
/*	
	@Override
	public int insertRevBoard(RevBoard rBoard) {
		return rDAO.insertRevboard(sqlSession,rBoard);
	}

	@Override
	public int insertAttm(Attachment a) {
		return rDAO.insertAttm(sqlSession,a);
	}

	@Override
	public int insertImg(int i) {
		return rDAO.insertImg(sqlSession,i);
	}

	@Override
	public int getRListCount() {
		return rDAO.getRListCount(sqlSession);
	}

	@Override
	public ArrayList<RevBoard> selectRevBoardList(PageInfo pi, int category) {
		return rDAO.selectRevBoardList(sqlSession,pi,category);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return rDAO.slectAttmList(sqlSession);
	}

	
*/
	

	
}
