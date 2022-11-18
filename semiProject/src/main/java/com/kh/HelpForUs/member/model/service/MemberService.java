package com.kh.HelpForUs.member.model.service;

import com.kh.HelpForUs.member.model.vo.Member;

public interface MemberService {

	int enroll(Member member);

	Member login(Member member);

	int checkUserName(String userName);

	int checkNickName(String nickName);

}
