package com.kh.HelpForUs.donBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.HelpForUs.donBoard.model.service.DonBoardService;

@Controller
public class DonBoardController {
	
	@Autowired
	private DonBoardService dService;
	
	// 봉사 게시글 리스트
	@RequestMapping("donBoardList.do")
	public String donBoardList() {
		return "boardListDon";
	}	
	
}
