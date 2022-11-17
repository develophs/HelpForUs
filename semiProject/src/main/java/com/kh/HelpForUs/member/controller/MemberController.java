package com.kh.HelpForUs.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.HelpForUs.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		System.out.println(bcrypt);
		return "login";
	}
	
	@RequestMapping("enrollView.me")
	public String enrollView() {
		return "enroll";
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "myPage";
	}
}
