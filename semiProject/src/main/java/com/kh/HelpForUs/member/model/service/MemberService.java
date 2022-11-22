package com.kh.HelpForUs.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.member.model.vo.Member;
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

	ArrayList<Message> selectMsgList(Map<String, Object> map, PageInfo pi);

	int getMsgListCount(Map<String, Object> map);

	int deleteMsg(int mId);


}
