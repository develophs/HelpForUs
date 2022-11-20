package com.kh.HelpForUs.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.HelpForUs.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// 봉사 게시글 리스트
	@RequestMapping("volBoardList.vo")
	public String volBoardList() {
		return "boardListVol";
	}
	
	// 모금 게시글 리스트
	@RequestMapping("donBoardList.do")
	public String donBoardList() {
		return "boardListDon";
	}
	
	// 후기 게시글 리스트
	@RequestMapping("reqBoardList.re")
	public String reqBoardList() {
		return "boardListRev";
	}
	
	
}
