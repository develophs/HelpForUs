package com.kh.HelpForUs.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.HelpForUs.common.exception.BoardException;
import com.kh.HelpForUs.common.model.service.CommonService;
import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Pagination;

@Controller
public class CommonController {
	
	Gson gson = new Gson();

	@Autowired
	private CommonService cService;
	
	@RequestMapping("count.co")
	public void count(HttpServletResponse response) {
		int roseCount = 0;
		ArrayList<Integer> roses = cService.countRose();
		int appCount = cService.countApp();
		
		for(int rose : roses) {
			roseCount += rose;
		}
		
		ArrayList<Integer> count = new ArrayList<>();
		count.add(roseCount);
		count.add(appCount);
		
		response.setContentType("application/json; charset=UTF-8");
		
		try {
			gson.toJson(count, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("latestBoard.co")
	public void latestBoard(HttpServletResponse response) {
		ArrayList<Board> bList = cService.latestBoard();
		ArrayList<Attachment> aList = cService.selectAttm();
		
		HashMap<String ,ArrayList> map = new HashMap<>();
		map.put("aList", aList);
		map.put("bList", bList);
		
		response.setContentType("application/json; charset=UTF-8");
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectNot.co")
	public void selectNot5(HttpServletResponse response) {
		ArrayList<Board> bList = cService.seletNot5();
		
		response.setContentType("application/json; charset=UTF-8");
		
		try {
			gson.toJson(bList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("notBoardList.no")
	public String notBoardList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) Integer cate,
							   @RequestParam(value="search", required=false) String search, Model model) {
		int category = 0;
		if(cate != null && cate > 0 && cate < 7) {
			category = cate;
		}
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("search", search);
		
		int listCount = cService.getNListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		ArrayList<Board> nList = cService.selectNotBoardList(pi, map);
		
		if(nList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("nList", nList);
			model.addAttribute("category", category);
			return "boardListNot";
		} else {
			throw new BoardException("공지 게시글 조회 실패");
		}
	}
}
