package com.kh.HelpForUs.volBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.HelpForUs.volBoard.model.service.VolBoardService;

@Controller
public class VolBoardController {
	
	@Autowired
	private VolBoardService vService;
	
	// 봉사 게시글 리스트
	@RequestMapping("volBoardList.vo")
	public String volBoardList() {
		return "boardListVol";
	}	
	
}
