package com.kh.HelpForUs.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.board.model.dao.BoardDAO;

@Service("bService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
