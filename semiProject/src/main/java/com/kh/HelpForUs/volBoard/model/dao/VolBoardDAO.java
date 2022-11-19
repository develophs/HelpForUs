package com.kh.HelpForUs.volBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.PageInfo;
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

	public int getVListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("volMapper.getVListCount");
	}

	public ArrayList<VolBoard> selectVolBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int category) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volMapper.selectVolBoardList", category, rowBounds);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("volMapper.selectAttmList");
	}

	public void volBoardCount(SqlSessionTemplate sqlSession, int bId) {
		sqlSession.update("volMapper.volBoardCount", bId);
	}

	public VolBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("volMapper.selectBoard", bId);
	}

	public ArrayList<Attachment> selectAttm(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("volMapper.selectAttm", bId);
	}

	public Cheer selectCheer(SqlSessionTemplate sqlSession, Cheer ch) {
		return sqlSession.selectOne("volMapper.selectCheer", ch);
	}

	public int cheerBoard(SqlSessionTemplate sqlSession, Cheer ch) {
		return sqlSession.insert("volMapper.cheerBoard", ch);
	}

	public int cheerCancle(SqlSessionTemplate sqlSession, Cheer ch) {
		return sqlSession.delete("volMapper.cheerCancle", ch);
	}
}
