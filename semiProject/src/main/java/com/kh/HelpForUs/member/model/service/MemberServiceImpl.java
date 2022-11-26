package com.kh.HelpForUs.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.dao.MemberDAO;
import com.kh.HelpForUs.member.model.vo.Member;

import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

import com.kh.HelpForUs.member.model.vo.Message;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int enroll(Member member) {
		return mDAO.enroll(sqlSession, member);
	}

	@Override
	public Member login(Member member) {
		return mDAO.login(sqlSession,member);
	}

	@Override
	public int updateRose(Map<String, Object> map) {
		return mDAO.updateRose(sqlSession,map);
	}
	
	@Override
	public int checkUserName(String userName) {
		return mDAO.checkUsername(sqlSession, userName);
	}


	@Override
	public int checkNickName(String nickName) {
		return mDAO.checkNickName(sqlSession,nickName);
	}

	@Override
	public int updateInfo(Member member) {
		return mDAO.updateInfo(sqlSession,member);
	}

	@Override
	public int deleteMember(String userName) {
		return mDAO.deleteMember(sqlSession,userName);
	}

	@Override
	public int insertPay(Map<String, Object> map) {
		return mDAO.insertPay(sqlSession,map);
	}

	@Override
	public int getDListCount(String userName) {
		return mDAO.getDListCount(sqlSession, userName);
	}

	@Override
	public int getVListCount(String userName) {
		return mDAO.getVListCount(sqlSession, userName);
	}

	@Override
	public int getGroupDListCount(String userName) {
		return mDAO.getGroupDListCount(sqlSession, userName);
	}

	@Override
	public int getGroupVListCount(String userName) {
		return mDAO.getGroupVListCount(sqlSession, userName);
	}

	@Override
	public int getEndDListCount(String userName) {
		return mDAO.getEndDListCount(sqlSession, userName);
	}

	@Override
	public int getEndVListCount(String userName) {
		return mDAO.getEndVListCount(sqlSession, userName);
	}

	@Override
	public ArrayList<DonBoard> getDList(PageInfo pi, String userName) {
		return mDAO.getDList(sqlSession, pi, userName);
	}

	@Override
	public ArrayList<VolBoard> getVList(PageInfo pi, String userName) {
		return mDAO.getVList(sqlSession, pi, userName);
	}

	@Override
	public ArrayList<DonBoard> getGroupDList(PageInfo pi, String userName) {
		return mDAO.getGroupDList(sqlSession, pi, userName);
	}

	@Override
	public ArrayList<VolBoard> getGroupVList(PageInfo pi, String userName) {
		return mDAO.getGroupVList(sqlSession, pi, userName);
	}

	@Override
	public ArrayList<DonBoard> getEndDList(PageInfo pi, String userName) {
		return mDAO.getEndDList(sqlSession, pi, userName);
	}

	@Override
	public ArrayList<VolBoard> getEndVList(PageInfo pi, String userName) {
		return mDAO.getEndVList(sqlSession, pi, userName);
	}

	@Override
	public ArrayList<Message> selectMsgList(Map<String, Object> map, PageInfo pi) {
		return mDAO.selectMsgList(sqlSession,map,pi);
	}

	@Override
	public int getMsgListCount(Map<String, Object> map) {
		return mDAO.getMsgListCount(sqlSession,map);
	}

	@Override
	public Message selectMsg(int mId) {
		return mDAO.selectMsg(sqlSession, mId);
	}

	@Override
	public int updateCheck(Map<String, Object> map) {
		return mDAO.updateCheck(sqlSession,map);
	}

	@Override
	public int deleteMsg(Map<String, Object> map) {
		return mDAO.deleteMsg(sqlSession,map);
	}

	@Override
	public int getMemberCount() {
		return mDAO.getMemberCount(sqlSession);
	}

	@Override
	public List<Member> getMemberList(PageInfo pi) {
		return mDAO.getMemberList(sqlSession,pi);
	}

	@Override
	public int getGroupCount() {
		return mDAO.getGroupCount(sqlSession);
	}

	@Override
	public List<Member> getGroupList(PageInfo pi) {
		return mDAO.getGroupList(sqlSession,pi);
	}

	@Override
	public long getAllListCount(String boardType) {
		return mDAO.getAllListCount(sqlSession,boardType);
	}

	@Override
	public List<Board> getAllList(String boardType, PageInfo pi) {
		return mDAO.getAllList(sqlSession, boardType,pi);
	}

	@Override
	public int inquiry(Message msg) {
		return mDAO.inquiry(sqlSession, msg);
	}

	@Override
	public int msgAlarm(String id) {
		return mDAO.msgAlarm(sqlSession, id);
	}

	@Override
	public int insertCertificate(Map<String, Object> map) {
		return mDAO.insertCertificate(sqlSession,map);
	}

	@Override
	public Attachment getCertificate(String memberUsername) {
		return mDAO.getCertificate(sqlSession,memberUsername);
	}

	@Override
	public int getGroupCertiCount() {
		return mDAO.getGroupCertiCount(sqlSession);
	}

	@Override
	public ArrayList<Attachment> getGroupCertificate(PageInfo pi) {
		return mDAO.getGroupCertificate(sqlSession,pi);
	}

	@Override
	public int authorizeGroup(String userName) {
		return mDAO.authorizeGroup(sqlSession, userName);
	}

	

	
}
