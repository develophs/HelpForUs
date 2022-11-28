package com.kh.HelpForUs.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.HelpForUs.common.exception.BoardException;
import com.kh.HelpForUs.common.exception.MemberException;
import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Pagination;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.service.MemberService;
import com.kh.HelpForUs.member.model.vo.CheerList;
import com.kh.HelpForUs.member.model.vo.Member;
import com.kh.HelpForUs.member.model.vo.Message;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

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
		
		System.out.println(result);
		System.out.println(result2);
		if(result + result2 == 2) {
			Member loginUser = mService.login(m);
			session.setAttribute("loginUser", loginUser);
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
	
	
	// 쪽지함 리스트
	@RequestMapping("message.me")
	public String messageView(HttpSession session, Model model, @RequestParam(value="msgType", required=false) Integer msgType, @RequestParam(value="page", required=false) Integer page) {
		Member m= (Member)session.getAttribute("loginUser");
		String id = m.getMemberUsername();
		
		//받는편지함 0
		//보낸편지함 1
		int type = 0;
		if(msgType!=null) {
			type = msgType;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);

		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		int listCount = mService.getMsgListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Message> msgList = mService.selectMsgList(map,pi);
		if(msgList != null) {
			model.addAttribute("msgList", msgList);
			model.addAttribute("pi", pi);
			model.addAttribute("msgType", msgType);
			
			return "messageBox";
		}else {
			throw new MemberException("쪽지 불러오기 실패. 다시 시도해 주세요");
		}
		
	}
	
	// 쪽지 삭제
	@RequestMapping("deleteMsg.me")
	public String deleteMsg(@RequestParam("mId") int mId,@RequestParam(value="msgType", required=false) Integer type, HttpSession session) {
		String id=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int msgType=0;
		if(type!=null) {
			msgType = type;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("id", id);
		map.put("msgType", msgType);
		
		
		int result = mService.deleteMsg(map);
		
		if(result > 0) {
			return "redirect:message.me";
		}else {
			throw new MemberException("쪽지 삭제 실패. 다시 시도해주세요");
		}
		
	}
	
	// 기부 내역
	@RequestMapping("donBoard.me")
	public String myDonBoard(HttpSession session, @RequestParam(value="page",required=false)Integer page,
			Model model) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		int listCount = mService.getDListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<DonBoard> list = mService.getDList(pi,userName);
		
		if(list.size() != 0) {
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			return "infoDonList";
		} else if(list.size() == 0) {
			model.addAttribute("message","기부한 게시글이 존재하지 않습니다.");
			return "infoDonList";
		} else {
			throw new MemberException("게시글 조회 실패");
		}
	}

	
	// 봉사 신청 내역
	@RequestMapping("volBoard.me")
	public String myVolBoard(HttpSession session,@RequestParam(value="page",required=false)Integer page,Model model) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
			if(page != null && page > 1) {
				currentPage = page;
		}
			
		int listCount = mService.getVListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<VolBoard> list = mService.getVList(pi,userName);
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			return "infoVolList";
		} else if(list.size() == 0) {
			model.addAttribute("message","신청한 게시글이 존재하지 않습니다.");
			return "infoVolList";
		} else {
			throw new MemberException("게시글 조회 실패");
		}
	}
	
	// 단체 작성한 기부 글
	@RequestMapping("donList.me")
	public String gourpDonBoard(HttpSession session, @RequestParam(value="page",required=false)Integer page,Model model){
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getGroupDListCount(userName);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<DonBoard> list = mService.getGroupDList(pi,userName);
		if(!list.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			return "groupDonList";
		} else if(list.size() == 0) {
			model.addAttribute("message","작성한 게시글이 존재하지 않습니다.");
			return "groupDonList";
		} else {
			throw new MemberException("작성한 게시글 조회 실패");
		}
	}
	
	// 단체 작성한 봉사모집 글
	@RequestMapping("volList.me")
	public String groupVolList(HttpSession session, @RequestParam(value="page",required=false)Integer page,
			Model model) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getGroupVListCount(userName);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<VolBoard> list = mService.getGroupVList(pi,userName);
		if(list.size() != 0) {
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			return "groupVolList";
		}else if(list.size() == 0) {
			model.addAttribute("message","작성한 게시글이 존재하지 않습니다.");
			return "groupVolList";
		} else {
			throw new MemberException("작성한 게시글 조회 실패");
		}
	}
	
	// 단체 기부 마감 현황
	@RequestMapping("endDonList.me")
	public String endDonList(HttpSession session, @RequestParam(value="page",required=false)Integer page,
			Model model) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getEndDListCount(userName);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<DonBoard> list = mService.getEndDList(pi,userName);
		
		if(list.size() != 0) {
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			return "groupDonEndList";
		} else if(list.size() == 0) {
			model.addAttribute("message","마감된 게시글이 존재하지 않습니다.");
			return "groupDonEndList";
		} else {
			throw new MemberException("게시글 조회 실패");
		}
	}
	
	// 단체 봉사모집 마감 현황
	@RequestMapping("endVolList.me")
	public String endVolList(HttpSession session, @RequestParam(value="page",required=false)Integer page,
			Model model) {
		String userName=((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
			
		int listCount = mService.getEndVListCount(userName);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<VolBoard> list = mService.getEndVList(pi,userName);
		if(!list.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			return "groupVolEndList";
		} else if(list.isEmpty()) {
			model.addAttribute("message","마감된 게시글이 존재하지 않습니다.");
			return "groupVolEndList";
		} else {
			throw new MemberException("게시글 조회 실패");
		}
	}
	
	//메시지 상세보기
	@RequestMapping("selectMsg.me")
	@ResponseBody
	public void selectMsg(@RequestParam("messageId") int mId, @RequestParam(value="msgType", required=false) Integer type,Model model, HttpServletResponse response,HttpSession session ) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		
		int msgType = 0;
		
		if(type!=null) {
			 msgType = type;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("id", id);
		map.put("msgType", msgType);
		
		Message m =  mService.selectMsg(mId);
		if(m!=null) {
			response.setContentType("application/json; charset=UTF-8");
			GsonBuilder gb = new GsonBuilder();
			Gson gson = gb.create();
			
			if(msgType!=1) {
				mService.updateCheck(map);
			}
			
			try {
				gson.toJson(m, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
		}else {
			throw new MemberException("쪽지 확인 실패. 다시 시도해주세요");
		}
	}
	
	// 관리자 페이지 - 회원 리스트
	@RequestMapping("memberList.me")
	public String getMemberList(@RequestParam(value="page",required=false)Integer page,Model model) {
		int memberCount = mService.getMemberCount();
		int currentPage = 0;
		if(page != null && page>0) {
			currentPage = page;
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, memberCount, 10);
		
		List<Member> memberList = mService.getMemberList(pi);
		
		if(memberList != null) {
			model.addAttribute("memberList",memberList);
			model.addAttribute("pi",pi);
			return "clientPage";
		} else {
			throw new MemberException("회원조회에 실패하셨습니다.");
		}
	}
	
	// 관리자 페이지 - 단체 리스트
	@RequestMapping("groupList.me")
	public String getGroupList(@RequestParam(value="page",required=false)Integer page,Model model) {
		int currentPage = 0;
		if(page!=null && page>0) {
			currentPage=page;
		}
		int groupCount = mService.getGroupCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, groupCount, 10);
		
		List<Member> groupList = mService.getGroupList(pi);
		
		if(groupList != null) {
			model.addAttribute("groupList",groupList);
			model.addAttribute("pi",pi);
			return "groupPage";
		} else {
			throw new MemberException("단체조회에 실패하셨습니다.");
		}
	}
	
	// 관리자 페이지 - 모금 게시글 관리
	@RequestMapping("allDList.me")
	public String getAllDList(@RequestParam(value="page", required=false) Long page, Model model) {
		long currentPage = 0;
		String boardType ="Don";
		if(page != null && page>0) {
			currentPage = page;
		}
		long allDListCount = mService.getAllListCount(boardType);
		PageInfo pi = Pagination.getPageInfo((int)currentPage, (int)allDListCount, 10);
		List<Board> allDList = mService.getAllList(boardType,pi);
		if(allDList != null) {
			model.addAttribute("allDList",allDList);
			model.addAttribute("pi",pi);
			return "allDList";
		} else {
			throw new MemberException("글 목록 조회 실패");
		}
		
	}
	
	// 관리자 페이지 - 봉사모집 관리
	@RequestMapping("allVList.me")
	public String getAllVList(@RequestParam(value="page", required=false) Long page, Model model) {
		long currentPage = 0;
		if(page!=null && page>0) {
			currentPage = page;
		}
		String boardType ="Vol";
		long allVListCount = mService.getAllListCount(boardType);
		PageInfo pi = Pagination.getPageInfo((int)currentPage, (int)allVListCount, 10);
		List<Board> allVList = mService.getAllList(boardType,pi);
		if(allVList != null) {
			model.addAttribute("allVList",allVList);
			model.addAttribute("pi",pi);
			return "allVList";
		} else {
			throw new MemberException("글 목록 조회 실패");
		}
	}
	
	// 문의 팝업
	@RequestMapping("inquiryView.me")
	public String inquiryView(@RequestParam("bId") int bId, @RequestParam("writer") String writer, Model model) {
		model.addAttribute("bId", bId);
		model.addAttribute("writer", writer);
		
		return "writeInquiry";
	}
	
	@RequestMapping("inquiry.me")
	@ResponseBody
	public int inquiry(@ModelAttribute Message msg, HttpSession session) {
		msg.setSenderUsername(((Member)session.getAttribute("loginUser")).getMemberUsername());
		
		int result = 0;
		
		if(msg.getMessageTitle().equals("") || msg.getMessageContent().equals("")) {
			result = 1;
		} else {
			result = mService.inquiry(msg);
		}
	
		if(result > 0) {
			return result;
		} else {
			throw new BoardException("문의 실패");
		}
	}
	
	//쪽지 알림
	@RequestMapping("msgAlarm.me")
	public void alarm(HttpSession session, HttpServletResponse response) {
		String id =((Member)session.getAttribute("loginUser")).getMemberUsername();
	
		int result = mService.msgAlarm(id);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//봉사단체 서류 제출함 이동
	@GetMapping("certificate.me")
	public String cetificateView(Model model,HttpSession session) {
		String memberUsername = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		String memberNickname = ((Member)session.getAttribute("loginUser")).getMemberNickname();
		
		Attachment attm = mService.getCertificate(memberUsername);
		if(attm != null) {
			model.addAttribute("attm",attm);
			model.addAttribute("memberNickname",memberNickname);
			return "certificateView";
		} else {
			model.addAttribute("msg","제출한 서류가 존재하지 않습니다.");
			return "certificateView";
		}
		
	}
	
	//봉사단체 서류 컴퓨터에 저장
	@PostMapping("certificate.me")
	public String insertCertificate(Model model, @RequestParam MultipartFile file, 
			HttpSession session,HttpServletRequest request) {
		if(file.isEmpty()) {
			return null;
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		String memberUsername = m.getMemberUsername();
		String originalName = file.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		
		// . +1부터 마지막까지
		String fileExt = originalName.substring(originalName.lastIndexOf(".") + 1);
		String renameName = uuid + "."+ fileExt;
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String renamePath = folder + "\\" + renameName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("userName", memberUsername);
		map.put("fileExt", fileExt);
		map.put("originalName", originalName);
		map.put("renameName", renameName);
		map.put("savePath", savePath);
		
		int result = mService.insertCertificate(map);
		System.out.println(result);
		return "redirect:/certificate.me";
	}
	
	// 관리자페이지 증명서 제출확인
	@GetMapping("groupCertificate.me")
	public String getGroupCer(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		int listCount = mService.getGroupCertiCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Attachment> cList = mService.getGroupCertificate(pi);
		if(cList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("cList", cList);
			return "adminCertificate";
		} else {
			throw new MemberException("단체 증명서 조회 실패");
		}
		
	}
	
	// 관리자페이지 증명서 확인 후 권한 부여
	@RequestMapping("authorize.me")
	@ResponseBody
	public String authorizeGroup(@RequestParam("memberUsername")String userName) {
		int result = mService.authorizeGroup(userName);
		String data = result>0 ? "yes" : "no";
		return data;
	}
	
	// 가입된 이메일 확인
	@RequestMapping("checkEmail.me")
	@ResponseBody
	public String checkEmail(@RequestParam("email")String email) {
		int count = mService.checkEmail(email);
		String result = count>0 ? "yes" : "no";
		return result;
	}
	
	// 비밀번호 재설정창 이동
	@GetMapping("modifyPwd.me")
	public String pwdView(@RequestParam("emailAdress")String email,Model model) {
		model.addAttribute("email",email);
		return "modifyPwd";
	}
	
	// 비밀번호 재설정
	@PostMapping("modifyPwd.me")
	public String modifyPwd(@RequestParam("pwd1")String pwd1, @RequestParam("pwd2")String pwd2,
			@RequestParam("email")String email) {
		if(!pwd1.equals(pwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		String enPwd = bcrypt.encode(pwd1);
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("enPwd", enPwd);
		
		int result = mService.modifyPwd(map);
		if(result>0) {
			return "redirect:/";
		} else {
			throw new MemberException("비밀번호 재설정에 실패하셨습니다.");
		}
		
	}
	
	// 응원한 기부목록
	@GetMapping("cheerDBoard.me")
	public String getCheerDBoard(@RequestParam(value="page",required=false)Integer page,Model model,HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 0;
		if(page!=null && page>0) {
			currentPage=page;
		}
		
		int count = mService.getCheerDCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, count, 10);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pi", pi);
		
		
		List<CheerList> cDList = mService.getCheerDBoard(map);
		System.out.println(cDList);
		if(cDList !=null) {
			model.addAttribute("cDList", cDList);
			model.addAttribute("pi", pi);
			return "cheerDList";
		} else {
			throw new MemberException("응원 기부 목록을 가져오는데 실패했습니다.");
		}
		
	}
	
	// 응원한 봉사목록
	@GetMapping("cheerVBoard.me")
	public String getCheerVBoard(@RequestParam(value="page",required=false)Integer page,Model model,HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		int currentPage = 0;
		if(page!=null && page>0) {
			currentPage=page;
		}
		
		int count = mService.getCheerVCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, count, 10);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pi", pi);
		
		
		List<CheerList> cVList = mService.getCheerVBoard(map);
		System.out.println(cVList);
		if(cVList != null) {
			model.addAttribute("cVList",cVList);
			model.addAttribute("pi",pi);
			return "cheerVList";
		} else {
			throw new MemberException("응원 봉사 목록을 가져오는데 실패했습니다.");
		}
		
		
	}
}
