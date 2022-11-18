package com.kh.HelpForUs.volBoard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.HelpForUs.common.exception.BoardException;
import com.kh.HelpForUs.member.model.vo.Member;
import com.kh.HelpForUs.volBoard.model.service.VolBoardService;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Controller
public class VolBoardController {
	
	@Autowired
	private VolBoardService vService;
	
	// 봉사 게시글 리스트
	@RequestMapping("volBoardList.vo")
	public String volBoardList() {
		return "boardListVol";
	}
	
	// 봉사 게시글글 작성 페이지 이동
	@RequestMapping("writeVolBoardView.vo")
	public String writeVolBoardView() {
		return "volBoardWrite";
	}
	
	// 봉사 게시글 insert
	@RequestMapping("writeVolBoard.vo")
	public String insertVolBoard(HttpSession session, @ModelAttribute VolBoard vBoard) {
		vBoard.setRefMemberUsername(((Member)session.getAttribute("loginUser")).getMemberUsername());
		int result = vService.insertVolBoard(vBoard);
		
		if(result > 0) {
			return "redirect:volBoardList.vo";
		} else {
			throw new BoardException("봉사 게시글 작성 실패");
		}
	}
}
