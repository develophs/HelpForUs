package com.kh.HelpForUs.member.model.service;

import java.util.HashMap;
import java.util.Map;

import com.kh.HelpForUs.member.model.vo.Member;

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

}
