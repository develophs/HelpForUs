package com.kh.HelpForUs.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("cDAO")
public class CommonDAO {

	public ArrayList<Integer> countRose(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("commonMapper.countRose");
	}

	public int countApp(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commonMapper.countApp");
	}
	
}
