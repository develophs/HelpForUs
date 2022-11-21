package com.kh.HelpForUs.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.model.dao.CommonDAO;

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
	
}
