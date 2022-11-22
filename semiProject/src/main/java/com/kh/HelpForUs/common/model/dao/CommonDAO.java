package com.kh.HelpForUs.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;

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

	public ArrayList<Board> selectNotBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("commonMapper.selectNotBoardList", map, rowBounds);
	}

	public int getNListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commonMapper.getNListCount");
	}

	public void updateCount(SqlSessionTemplate sqlSession, int bId) {
		sqlSession.update("commonMapper.updateCount", bId);
	}

	public Board selectnotBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("commonMapper.selectnotBoard", bId);
	}
	
}
