package com.kh.HelpForUs.revBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.revBoard.model.vo.RevBoard;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Repository("rDAO")
public class RevBoardDAO {

	public int insertRevBoard(SqlSessionTemplate sqlSession, RevBoard rBoard) {
		return sqlSession.insert("RevMapper.insertRevBoard",rBoard);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("RevMapper.insertAttm", a);
	}

	public int insertImg(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.insert("RevMapper.insertImg", i);
	}

	public int getVListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("RevMapper.getRListCount");
	}

	public int getRListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("RevMapper.getRListCount");
	}

	public ArrayList<VolBoard> selectVolBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int category) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("RevMapper.selectVolBoardList", category, rowBounds);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("RevMapper.selectAttmList");
	}

	

	
	
}
	
	
	
	
	
	
	
	
	
	

/*	public int insertRevboard(SqlSessionTemplate sqlSession, RevBoard rBoard) {
		return  sqlSession.insert("RevMapper.insertRevBoard", rBoard);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("RevMapper.insertAttm",a);
	}

	public int insertImg(SqlSessionTemplate sqlSession, int i) {		
		return sqlSession.insert("RevMapper.insertImg",i);
	}

	public int getRListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("RevMapper.getRListCount");
	}

	public ArrayList<RevBoard> selectRevBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int category) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("RevMapper.selectRevBoardList", category, rowBounds);
	}

	public ArrayList<Attachment> slectAttmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("volMapper.selectAttmList");
	} 
 */
	
	


