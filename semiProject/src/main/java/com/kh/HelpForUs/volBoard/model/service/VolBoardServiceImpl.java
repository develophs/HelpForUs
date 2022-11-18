package com.kh.HelpForUs.volBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
