package com.kh.HelpForUs.volBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Repository("vDAO")
public class VolBoardDAO {

	public int insertVolBoard(SqlSessionTemplate sqlSession, VolBoard vBoard) {
		return sqlSession.insert("volMapper.insertVolBoard", vBoard);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("volMapper.insertAttm", a);
	}

	public int insertImg(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("volMapper.insertImg");
	}
}
