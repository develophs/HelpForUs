package com.kh.HelpForUs.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginView.me")
	public String loginView() {
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
