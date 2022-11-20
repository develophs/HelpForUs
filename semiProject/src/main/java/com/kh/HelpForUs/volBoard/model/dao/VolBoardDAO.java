package com.kh.HelpForUs.volBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.Image;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.member.model.vo.Message;
import com.kh.HelpForUs.volBoard.model.vo.Application;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Repository("vDAO")
public class VolBoardDAO {

	public int insertVolBoard(SqlSessionTemplate sqlSession, VolBoard vBoard) {
		return sqlSession.insert("volMapper.insertVolBoard", vBoard);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("volMapper.insertAttm", a);
	}

	public int insertImg(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.insert("volMapper.insertImg", i);
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

	public int updateVolBoard(SqlSessionTemplate sqlSession, VolBoard v) {
		int result = sqlSession.update("volMapper.updateBoard", v);
		result += sqlSession.update("volMapper.updateVolunteer", v);
		result += sqlSession.update("volMapper.updateManager", v);
		return result;
	}

	public int deleteAttm(SqlSessionTemplate sqlSession, ArrayList<String> delRename) {
		return sqlSession.delete("volMapper.deleteAttm", delRename);
	}

	public void updateAttmLevel(SqlSessionTemplate sqlSession, int boardId) {
		sqlSession.update("volMapper.updateAttmLevel", boardId);
	}

	public void deleteImage(SqlSessionTemplate sqlSession, Image img) {
		sqlSession.delete("volMapper.deleteImage", img);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("volMapper.deleteBoard", bId);
	}

	public int deleteAttmStatus(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("volMapper.deleteAttmStatus", bId);
	}

	public ArrayList<Application> selectApp(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("volMapper.selectApp", bId);
	}

	public int applicationVol(SqlSessionTemplate sqlSession, Application app) {
		return sqlSession.insert("volMapper.applicationVol", app);
	}

	public int applicationVolCancle(SqlSessionTemplate sqlSession, Application app) {
		return sqlSession.delete("volMapper.applicationVolCancle", app);
	}

	public int inquiryVol(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("volMapper.inquiryVol", msg);
	}
}
