package com.kh.HelpForUs.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.HelpForUs.member.exception.MemberException;
import com.kh.HelpForUs.member.model.service.MemberService;
import com.kh.HelpForUs.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
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
	
	@RequestMapping("rose.me")
	public String rose() {
		return "rose";
	}
	
	// 회원가입 메서드
	@RequestMapping("enroll.me")
	public String enroll(@ModelAttribute("Member")Member member,@RequestParam("memberPwd2")String memberPwd2) {
		if(!member.getMemberPwd().equals(memberPwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		
		String enPwd = bcrypt.encode(member.getMemberPwd());
		member.setMemberPwd(enPwd);
		
		int result = mService.enroll(member);
		
		if(result>0){
			System.out.println("회원가입 성공");
			return "redirect:/";
		} else {
			throw new MemberException("회원가입에 실패했습니다.");
		}
	}
	
	// 로그인 메서드
	@RequestMapping("login.me")
	public String login(@ModelAttribute("Member")Member member,HttpSession session) {
		Member loginUser = mService.login(member);
		
		String rawPwd = member.getMemberPwd();
		String enPwd = loginUser.getMemberPwd();
		
		if(bcrypt.matches(rawPwd, enPwd)) {
			session.setMaxInactiveInterval(1800);
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		} else {
			throw new MemberException("로그인에 실패 하셨습니다.");
		}
	}
	
	// 로그아웃 메서드
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 장미 구입
	@RequestMapping("updateRose.me")
	public String updateRose(HttpSession session, @RequestParam("roseNum") int roseNum ){
		Member m = ((Member)session.getAttribute("loginUser"));
		String id = m.getMemberUsername();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("roseNum", roseNum);
		
		int result = mService.updateRose(map);
		
		if(result>0) {
			session.setAttribute("loginUser", mService.login(m));
			return "rose";
		}else {
			throw new MemberException("장미 충천을 실패했습니다.");
		}
		
	}
	
	
	
	
	
}
