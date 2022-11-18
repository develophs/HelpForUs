package com.kh.HelpForUs.revBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.revBoard.model.dao.RevBoardDAO;

@Service("rService")
public class RevBoardServiceImpl implements RevBoardService{

	@Autowired
	private RevBoardDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
