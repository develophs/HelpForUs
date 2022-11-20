package com.kh.HelpForUs.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.HelpForUs.member.model.vo.Member;

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

}
