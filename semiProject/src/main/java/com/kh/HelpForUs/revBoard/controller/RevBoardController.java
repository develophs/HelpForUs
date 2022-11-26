package com.kh.HelpForUs.revBoard.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.HelpForUs.common.exception.BoardException;
import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Pagination;
import com.kh.HelpForUs.donBoard.model.service.DonBoardService;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.vo.Donation;
import com.kh.HelpForUs.member.model.vo.Member;
import com.kh.HelpForUs.revBoard.model.service.RevBoardService;
import com.kh.HelpForUs.revBoard.model.vo.RevBoard;
import com.kh.HelpForUs.volBoard.model.service.VolBoardService;
import com.kh.HelpForUs.volBoard.model.vo.Application;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Controller
public class RevBoardController {
	
	
	@Autowired
	private RevBoardService rService;
	
	@Autowired
	private DonBoardService dService;
	
	@Autowired
	private VolBoardService vService;
	
	// 봉사/기부 게시판 리스트 // 게시판리스트로 넘어감
	@RequestMapping("revBoardList.re")
	public String RevBoardList(@RequestParam(value="page", required=false) Integer page, Model model, @RequestParam(value="category", required=false) Integer cate) {
		int category = 0;
		if(cate != null && cate > 0 && cate < 7) {
			category = cate;
		}
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		int listCount = rService.getRListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		ArrayList<VolBoard> rList = rService.selectVolBoardList(pi, category);
		ArrayList<Attachment> aList = rService.selectAttmList();
		
		if(rList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("aList", aList);
			model.addAttribute("category", category);
			return "boardListRev";
		} else {
			throw new BoardException("봉사 게시글 조회 실패");
		}
	}
		
	
	@RequestMapping("volRevWrite.re") 
	public ModelAndView volRevWrite(@RequestParam("bId") int bId, ModelAndView mv) {
		
		boolean yn =false;
		VolBoard v = vService.selectVolBoard(bId, yn);

		if(v != null) { 
			mv.addObject("v",v); 
			mv.setViewName("volRevWrite");
			return mv; 
		}else { 
			throw new BoardException("게시글 작성 실패"); }
	 
	  }
	
	@RequestMapping("donRevWrite.re") 
	public ModelAndView donRevWrite(@RequestParam("bId") int bId, ModelAndView mv) {
		
		boolean yn =false;
		DonBoard d = dService.selectDonBoard(bId, yn);
		System.out.println(d);
		if(d != null) { 
			mv.addObject("d",d); 
			mv.setViewName("donRevWrite");
			return mv; 
		}else { 
			throw new BoardException("게시글 작성 실패"); }
	 
	  }

	

}