package com.kh.HelpForUs.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.HelpForUs.member.model.dao.MemberDAO;
import com.kh.HelpForUs.member.model.vo.Member;

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
}
