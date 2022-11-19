package com.kh.HelpForUs.volBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.volBoard.model.dao.VolBoardDAO;
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
	public int insertAttm(Attachment a) {
		return vDAO.insertAttm(sqlSession, a);
	}

	@Override
	public int insertImg() {
		return vDAO.insertImg(sqlSession);
	}

	@Override
	public int getVListCount() {
		return vDAO.getVListCount(sqlSession);
	}

	@Override
	public ArrayList<VolBoard> selectVolBoardList(PageInfo pi, int category) {
		return vDAO.selectVolBoardList(sqlSession, pi, category);
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
}
