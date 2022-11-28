package com.kh.HelpForUs.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.vo.CheerList;
import com.kh.HelpForUs.member.model.vo.Member;

import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

import com.kh.HelpForUs.member.model.vo.Message;

public interface MemberService {

	int enroll(Member member);

	Member login(Member member);

	int updateRose(Map<String, Object> map);

	int checkUserName(String userName);

	int checkNickName(String nickName);

	int updateInfo(Member member);

	int deleteMember(String userName);

	int insertPay(Map<String, Object> map);

	int getDListCount(String userName);

	int getVListCount(String userName);

	int getGroupDListCount(String userName);

	int getGroupVListCount(String userName);

	int getEndDListCount(String userName);

	int getEndVListCount(String userName);

	ArrayList<DonBoard> getDList(PageInfo pi, String userName);

	ArrayList<VolBoard> getVList(PageInfo pi, String userName);

	ArrayList<DonBoard> getGroupDList(PageInfo pi, String userName);

	ArrayList<VolBoard> getGroupVList(PageInfo pi, String userName);

	ArrayList<DonBoard> getEndDList(PageInfo pi, String userName);

	ArrayList<VolBoard> getEndVList(PageInfo pi, String userName);

	ArrayList<Message> selectMsgList(Map<String, Object> map, PageInfo pi);

	int getMsgListCount(Map<String, Object> map);

	Message selectMsg(int mId);

	int updateCheck(Map<String, Object> map);

	int deleteMsg(Map<String, Object> map);

	int getMemberCount();

	List<Member> getMemberList(PageInfo pi);

	int getGroupCount();

	List<Member> getGroupList(PageInfo pi);

	long getAllListCount(String boardType);

	List<Board> getAllList(String boardType, PageInfo pi);

	int inquiry(Message msg);

	int msgAlarm(String id);

	int insertCertificate(Map<String, Object> map);

	Attachment getCertificate(String memberUsername);

	int getGroupCertiCount();

	ArrayList<Attachment> getGroupCertificate(PageInfo pi);

	int authorizeGroup(String userName);

	int checkEmail(String email);

	int modifyPwd(Map<String, String> map);


	int getCheerDCount(String id);

	int getCheerVCount(String id);

	List<CheerList> getCheerDBoard(Map<String, Object> map);

	List<CheerList> getCheerVBoard(Map<String, Object> map);

	int getRepCount(String boardType);

	List<Member> getRepList(PageInfo pi, String boardType);
	
	int getRRepCount();

	List<Member> getRRepList(PageInfo pi);

	int getACount(Map<String,Object> map);

	List<Member> getAppList(Map<String, Object> map);

	





}
