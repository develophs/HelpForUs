package com.kh.HelpForUs.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.HelpForUs.common.exception.MemberException;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Pagination;
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
	
	@RequestMapping("myPage.me")
	public String myPageView() {
		return "mypage";
	}
	
	// 회원가입 작성 이동
	@RequestMapping("enrollView.me")
	public String enrollView(@RequestParam("right") String right,Model model) {
		model.addAttribute("right", right);
		return "enroll";
	}
	
	// 회원가입 일반,단체 선택 이동
	@RequestMapping("enrollButton.me")
	public String enrollButtonView() {
		return "enrollButton";
	}
	

	@RequestMapping("rose.me")
	public String rose() {
		return "rose";
	}
	
	// 회원가입 메서드
	@RequestMapping("enroll.me")
	public String enroll(@ModelAttribute("Member")Member member,@RequestParam("memberPwd2")String memberPwd2){
		if(!member.getMemberPwd().equals(memberPwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		
		String enPwd = bcrypt.encode(member.getMemberPwd());
		member.setMemberPwd(enPwd);
		
		int result = mService.enroll(member);
		
		if(result>0){
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
		int result2 = mService.insertPay(map);
		
		if(result + result2 == 2) {
			session.setAttribute("loginUser", mService.login(m));
			return "rose";
		}else {
			throw new MemberException("장미 충천을 실패했습니다.");
		}
	}
		

		
	// 내정보 이동 메서드
	@RequestMapping("myInfo.me")
	public String myInfo() {
		return "myinfo";
	}
	
	// 아이디 중복 검사 메서드
	@RequestMapping("checkUesrname.me")
	@ResponseBody
	public String checkUserName(@RequestParam("userName")String userName){
		int count = mService.checkUserName(userName);
		String result = count>0 ? "yes" : "no";
		return result;
	}
	
	// 닉네임 중복 검사 메서드
	@RequestMapping("checkNickName.me")
	@ResponseBody
	public String checkNickName(@RequestParam("nickName")String nickName){
		int count = mService.checkNickName(nickName);
		String result = count>0 ? "yes" : "no";
		return result;
	}
	
	// 회원 정보 수정 메서드
	@RequestMapping("updateInfo.me")
	public String updateInfo(@ModelAttribute Member member,@RequestParam("memberPwd2")String memberPwd2,HttpSession session) {
		if(!member.getMemberPwd().equals(memberPwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		String rawPwd = member.getMemberPwd();
		String enPwd = bcrypt.encode(rawPwd);
		member.setMemberPwd(enPwd);
		
		int result = mService.updateInfo(member);
		
		if(result>0) {
			session.invalidate();
			return "redirect:/";
		} else {
			throw new MemberException("회원 정보 수정에 실패하셨습니다.");
		}
	}
	
	// 회원 탈퇴 메서드
	@RequestMapping("deleteMember.me")
	public String deleteMember(HttpSession session) {
		String userName = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		int result = mService.deleteMember(userName);
		
		if(result>0) {
			session.invalidate();
			return "redirect:/";
		} else {
			throw new MemberException("회원 탈퇴 실패");
		}
	}
	
	// 관리자 페이지 이동
	@RequestMapping("admin.me")
	public String adminView() {
		return "adminpage";
	}
	
	// (관리자)회원 관리 페이지
	@RequestMapping("client.me")
	public String clientView() {
		return "clientPage";
	}
	
	// (관리자)단체 관리 페이지
	@RequestMapping("group.me")
	public String groupView() {
		return "groupPage";
	}
	
	
	// 쪽지함 뷰 이동
	@RequestMapping("message.me")
	public String messageView(HttpSession session) {
		String right = ((Member)session.getAttribute("loginUser")).getMemberRight();
		if(right.equals("A")) {
			return "messageBoxManager";
		} else {
			return "messageBox";
		}
	}
	
	// 기부 내역
	@RequestMapping("donBoard.me")
	public String myDonBoard(HttpSession session, @RequestParam(value="page",required=false)Integer page) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		int listCount = mService.getDListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		return "infoDonList";
	}
	
	// 봉사 신청 내역
	@RequestMapping("volBoard.me")
	public String myVolBoard(HttpSession session,@RequestParam(value="page",required=false)Integer page) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
			if(page != null && page > 1) {
				currentPage = page;
		}
			
		int listCount = mService.getVListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		return "infoVolList";
	}
	
	// 단체 작성한 기부 글
	@RequestMapping("donList.me")
	public String gourpDonBoard(HttpSession session, @RequestParam(value="page",required=false)Integer page){
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getGroupDListCount(userName);
		return "groupDonList";
	}
	
	// 단체 작성한 봉사모집 글
	@RequestMapping("volList.me")
	public String groupVolList(HttpSession session, @RequestParam(value="page",required=false)Integer page) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getGroupVListCount(userName);
		return "groupVolList";
	}
	
	// 단체 기부 마감 현황
	@RequestMapping("endDonList.me")
	public String endDonList(HttpSession session, @RequestParam(value="page",required=false)Integer page) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getEndDListCount(userName);
		return "groupDonEndList";
	}
	
	// 단체 봉사모집 마감 현황
	@RequestMapping("endVolList.me")
	public String endVolList(HttpSession session, @RequestParam(value="page",required=false)Integer page) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getEndVListCount(userName);
		return "groupVolEndList";
	}
	
	
}
