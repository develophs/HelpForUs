package com.kh.HelpForUs.donBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.Image;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Reply;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.vo.Donation;
import com.kh.HelpForUs.member.model.vo.Member;
import com.kh.HelpForUs.volBoard.model.vo.Application;

@Repository("dDAO")
public class DonBoardDAO {

	public int getDonListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("donationMapper.getDonListCount", i);
	}

	public ArrayList<DonBoard> selectDonList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonList", map, rowBounds);
	}
	
	public int insertDonBoard(SqlSessionTemplate sqlSession, DonBoard dB) {
		return sqlSession.insert("donationMapper.insertDonBoard", dB);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("donationMapper.insertAttm", map);
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

	public Cheer cheer(SqlSessionTemplate sqlSession, Cheer c) {
		return sqlSession.selectOne("donationMapper.cheer", c);
	}

	public int cheerUp(SqlSessionTemplate sqlSession, Cheer cheerUp) {
		return sqlSession.insert("donationMapper.cheerUp", cheerUp);
	}

	public int cheerCancle(SqlSessionTemplate sqlSession, Cheer cheerUp) {
		return sqlSession.delete("donationMapper.cheerCancle", cheerUp);
	}

	public void donBoardCount(SqlSessionTemplate sqlSession, int bId) {
		sqlSession.update("donationMapper.donBoardCount", bId);
	}

	public int roseDonation(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("donationMapper.roseDonation", m);
	}

	public int breakdownDon(SqlSessionTemplate sqlSession, Donation don) {
		return sqlSession.insert("donationMapper.breakdownDon", don);
	}

	public int replyInsert(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("donationMapper.replyInsert", r);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, Reply r) {
		return (ArrayList)sqlSession.selectList("donationMapper.selectReply", r);
	}

	public int deleteDonBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("donationMapper.deleteDonBoard", bId);
	}

	public int updateDonBoard(SqlSessionTemplate sqlSession, DonBoard dB) {
		return sqlSession.update("donationMapper.updateDonBoard", dB);
	}

	public int deleteAttm(SqlSessionTemplate sqlSession, ArrayList<String> delRename) {
		return sqlSession.delete("donationMapper.deleteAttm", delRename);
	}

	public void updateAttmLevel(SqlSessionTemplate sqlSession, int boardId) {
		sqlSession.update("donationMapper.updateAttmLevel", boardId);
		
	}

	public void deleteImage(SqlSessionTemplate sqlSession, Image img) {
		sqlSession.delete("donationMapper.deleteImg", img);
		
	}

	public int deleteAttmStatus(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("donationMapper.deleteAttmStatus", bId);
	}

	public int fundraisingUpdate(SqlSessionTemplate sqlSession, DonBoard dFund) {
		return sqlSession.update("donationMapper.fundraisingUpdate", dFund);
	}

	public int selectCurrRose(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("donationMapper.selectCurrRose", id);
	}




}
