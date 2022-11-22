package com.kh.HelpForUs.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;

@Repository("cDAO")
public class CommonDAO {

	public ArrayList<Integer> countRose(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("commonMapper.countRose");
	}

	public int countApp(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commonMapper.countApp");
	}

	public ArrayList<Board> latestBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("commonMapper.latestBoard");
	}

	public ArrayList<Attachment> selectAttm(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("commonMapper.selectAttm");
	}

	public ArrayList<Board> selectNot5(SqlSessionTemplate sqlSession) {
		return	(ArrayList)sqlSession.selectList("commonMapper.selectNot5");
	}
	
}
