package com.kh.HelpForUs.volBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.Image;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.member.model.vo.Message;
import com.kh.HelpForUs.volBoard.model.dao.VolBoardDAO;
import com.kh.HelpForUs.volBoard.model.vo.Application;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Service("vService")
public class VolBoardServiceImpl implements VolBoardService{

	@Autowired
	private VolBoardDAO vDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertVolBoard(VolBoard vBoard) {
		return vDAO.insertVolBoard(sqlSession, vBoard);
	}

	@Override
	public int insertAttm(HashMap<String, Object> map) {
		return vDAO.insertAttm(sqlSession, map);
	}

	@Override
	public int getVListCount() {
		return vDAO.getVListCount(sqlSession);
	}

	@Override
	public ArrayList<VolBoard> selectVolBoardList(PageInfo pi, HashMap<String, Object> map) {
		return vDAO.selectVolBoardList(sqlSession, pi, map);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return vDAO.selectAttmList(sqlSession);
	}

	@Override
	public VolBoard selectVolBoard(int bId, boolean yn) {
		if(yn) {
			vDAO.volBoardCount(sqlSession, bId);
		}
		return vDAO.selectBoard(sqlSession, bId);
	}
	
	@Override
	public ArrayList<Attachment> selectAttm(int bId) {
		return vDAO.selectAttm(sqlSession, bId);
	}

	@Override
	public Cheer selectCheer(Cheer ch) {
		return vDAO.selectCheer(sqlSession, ch);
	}
	
	@Override
	public int cheerBoard(Cheer ch) {
		return vDAO.cheerBoard(sqlSession, ch);
	}
	
	@Override
	public int cheerCancle(Cheer ch) {
		return vDAO.cheerCancle(sqlSession, ch);
	}

	@Override
	public int updateVolBoard(VolBoard v) {
		return vDAO.updateVolBoard(sqlSession, v);
	}
	
	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return vDAO.deleteAttm(sqlSession, delRename);
	}
	
	@Override
	public void updateAttmLevel(int boardId) {
		vDAO.updateAttmLevel(sqlSession, boardId);
	}
	
	@Override
	public void deleteImage(Image img) {
		vDAO.deleteImage(sqlSession, img);
	}
	
	@Override
	public int deleteBoard(int bId) {
		return vDAO.deleteBoard(sqlSession, bId);
	}
	
	@Override
	public int deleteAttmStatus(int bId) {
		return vDAO.deleteAttmStatus(sqlSession, bId);
	}

	@Override
	public ArrayList<Application> selectApp(int bId) {
		return vDAO.selectApp(sqlSession, bId);
	}
	
	@Override
	public int applicationVol(Application app) {
		return vDAO.applicationVol(sqlSession, app);
	}
	
	@Override
	public int applicationVolCancle(Application app) {
		return vDAO.applicationVolCancle(sqlSession, app);
	}
	
//	@Override
//	public int inquiryVol(Message msg) {
//		return vDAO.inquiryVol(sqlSession, msg);
//	}
}
