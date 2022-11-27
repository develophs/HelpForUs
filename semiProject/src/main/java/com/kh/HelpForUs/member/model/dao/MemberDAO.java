package com.kh.HelpForUs.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.vo.Member;

import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

import com.kh.HelpForUs.member.model.vo.Message;

@Repository("mDAO")
public class MemberDAO {

	public int enroll(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.enroll", member);
	}

	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login", member);
	}

	public int updateRose(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateRose", map);
	}
	public int checkUsername(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.checkUsername",userName);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickName", nickName);
	}

	public int updateInfo(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateInfo", member);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.update("memberMapper.deleteMember", userName);
	}

	public int insertPay(SqlSessionTemplate sqlSession, Map<String, Object> map ) {
		return  sqlSession.insert("memberMapper.insertPay", map);
	}

	public int getDListCount(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.getDListCount", userName);
	}

	public int getVListCount(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.getVListCount", userName);
	}

	public int getGroupDListCount(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.getGroupDListCount", userName);
	}

	public int getGroupVListCount(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.getGroupVListCount", userName);
	}

	public int getEndDListCount(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.getEndDListCount", userName);
	}

	public int getEndVListCount(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.selectOne("memberMapper.getEndVListCount", userName);
	}

	public ArrayList<DonBoard> getDList(SqlSessionTemplate sqlSession, PageInfo pi, String userName) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getDList", userName, rowBounds);
	}

	public ArrayList<Message> selectMsgList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMsgList", map, rowBounds);
	}

	public int getMsgListCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.getMsgListCount", map);
	}

	public ArrayList<VolBoard> getVList(SqlSessionTemplate sqlSession, PageInfo pi, String userName) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getVList", userName, rowBounds);
	}

	public ArrayList<DonBoard> getGroupDList(SqlSessionTemplate sqlSession, PageInfo pi, String userName) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getGroupDList", userName, rowBounds);
	}

	public ArrayList<VolBoard> getGroupVList(SqlSessionTemplate sqlSession, PageInfo pi, String userName) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getGroupVList", userName, rowBounds);
	}

	public ArrayList<DonBoard> getEndDList(SqlSessionTemplate sqlSession, PageInfo pi, String userName) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getEndDList", userName, rowBounds);
	}

	public ArrayList<VolBoard> getEndVList(SqlSessionTemplate sqlSession, PageInfo pi, String userName) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getEndVList", userName, rowBounds);
	}

	public Message selectMsg(SqlSessionTemplate sqlSession, int mId) {
		return sqlSession.selectOne("memberMapper.selectMsg",mId);
	}

	public int updateCheck(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateCheck", map);
	}

	public int deleteMsg(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("memberMapper.deleteMsg", map);
	}

	public int getMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getMemberCount");
	}

	public List<Member> getMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getMemberList", null, rowBounds);
	}

	public int getGroupCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getGroupCount");
	}

	public List<Member> getGroupList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getGroupList", null, rowBounds);
	}

	public long getAllListCount(SqlSessionTemplate sqlSession,String boardType) {
		return sqlSession.selectOne("memberMapper.getAllListCount", boardType);
	}

	public List<Board> getAllList(SqlSessionTemplate sqlSession, String boardType, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getAllList", boardType,rowBounds);
	}

	public int inquiry(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("memberMapper.inquiry", msg);
	}

	public int msgAlarm(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.notReadMsg", id);
	}

	public int insertCertificate(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("memberMapper.insertCertificate", map);
	}

	public Attachment getCertificate(SqlSessionTemplate sqlSession, String memberUsername) {
		return sqlSession.selectOne("memberMapper.getCertificate", memberUsername);
	}

	public int getGroupCertiCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getGroupCertiCount");
	}

	public ArrayList<Attachment> getGroupCertificate(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds row = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getGroupCertificate", null, row);
	}

	public int authorizeGroup(SqlSessionTemplate sqlSession, String userName) {
		return sqlSession.update("memberMapper.authorizeGroup", userName);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}


	public int modifyPwd(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("memberMapper.modifyPwd", map);
	}
	
	
}