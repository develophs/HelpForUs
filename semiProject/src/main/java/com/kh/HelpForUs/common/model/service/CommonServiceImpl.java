package com.kh.HelpForUs.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.model.dao.CommonDAO;
import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;

@Service("cService")
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Integer> countRose() {
		return cDAO.countRose(sqlSession);
	}

	@Override
	public int countApp() {
		return cDAO.countApp(sqlSession);
	}

	@Override
	public ArrayList<Board> latestBoard() {
		return cDAO.latestBoard(sqlSession);
	}

	@Override
	public ArrayList<Attachment> selectAttm() {
		return cDAO.selectAttm(sqlSession);
	}

	@Override
	public ArrayList<Board> seletNot5() {
		return cDAO.selectNot5(sqlSession);
	}

	@Override
	public ArrayList<Board> selectNotBoardList(PageInfo pi, HashMap<String, Object> map) {
		return cDAO.selectNotBoardList(sqlSession, pi, map);
	}

	@Override
	public int getNListCount() {
		return cDAO.getNListCount(sqlSession);
	}

	@Override
	public Board selectnotBoard(int bId, boolean yn) {
		if(yn) {
			cDAO.updateCount(sqlSession, bId);
		}
		return cDAO.selectnotBoard(sqlSession, bId);
	}
	
}
