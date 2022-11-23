package com.kh.HelpForUs.donBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.volBoard.model.vo.Application;

@Repository("dDAO")
public class DonBoardDAO {

	public int getDonListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("donationMapper.getDonListCount", i);
	}

	public ArrayList<DonBoard> selectDonList(SqlSessionTemplate sqlSession, PageInfo pi, int cate) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonList", cate, rowBounds);
	}
	
	public int insertDonBoard(SqlSessionTemplate sqlSession, DonBoard dB) {
		return sqlSession.insert("donationMapper.insertDonBoard", dB);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, Attachment attachment) {
		return sqlSession.insert("donationMapper.insertAttm", attachment);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("donationMapper.selectAttmList");
	}

	public int insertImg(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.insert("donationMapper.insertImg", i);
	}

	public DonBoard selectDonBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("donationMapper.selectDonBoard", bId);
	}

	public ArrayList<Attachment> selectDonAttm(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonAttm", bId);
	}


}
