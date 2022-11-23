package com.kh.HelpForUs.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
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



}
