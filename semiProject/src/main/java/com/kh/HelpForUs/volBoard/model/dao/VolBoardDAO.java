package com.kh.HelpForUs.volBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Repository("vDAO")
public class VolBoardDAO {

	public int insertVolBoard(SqlSessionTemplate sqlSession, VolBoard vBoard) {
		return sqlSession.insert("volMapper.insertVolBoard", vBoard);
	}

}
