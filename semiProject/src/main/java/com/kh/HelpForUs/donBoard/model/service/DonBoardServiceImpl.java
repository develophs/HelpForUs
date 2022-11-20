package com.kh.HelpForUs.donBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.donBoard.model.dao.DonBoardDAO;

@Service("dService")
public class DonBoardServiceImpl implements DonBoardService{

	@Autowired
	private DonBoardDAO dDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
