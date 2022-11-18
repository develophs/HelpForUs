package com.kh.HelpForUs.revBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.HelpForUs.revBoard.model.service.RevBoardService;

@Controller
public class RevBoardController {
	
	@Autowired
	private RevBoardService rService;
	
	// 봉사 게시글 리스트
	@RequestMapping("revBoardList.re")
	public String revBoardList() {
		return "boardListRev";
	}	
	
}
