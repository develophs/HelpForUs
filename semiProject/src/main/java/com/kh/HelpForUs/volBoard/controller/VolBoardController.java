package com.kh.HelpForUs.volBoard.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.HelpForUs.common.exception.BoardException;
import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Pagination;
import com.kh.HelpForUs.member.model.vo.Member;
import com.kh.HelpForUs.volBoard.model.service.VolBoardService;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Controller
public class VolBoardController {
	
	@Autowired
	private VolBoardService vService;
	
	// 봉사 게시글 리스트
	@RequestMapping("volBoardList.vo")
	public String volBoardList(@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		int listCount = vService.getVListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		ArrayList<VolBoard> vList = vService.selectVolBoardList(pi);
		ArrayList<Attachment> aList = vService.selectAttmList();
		
		if(vList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("vList", vList);
			model.addAttribute("aList", aList);
			return "boardListVol";
		} else {
			throw new BoardException("봉사 게시글 조회 실패");
		}
	}
	
	// 봉사 게시글글 작성 페이지 이동
	@RequestMapping("writeVolBoardView.vo")
	public String writeVolBoardView() {
		return "volBoardWrite";
	}
	
	// 봉사 게시글 insert
	@RequestMapping("writeVolBoard.vo")
	public String insertVolBoard(HttpServletRequest request, @ModelAttribute VolBoard vBoard, @RequestParam("file") ArrayList<MultipartFile> files) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberUsername();
		vBoard.setRefMemberUsername(id);
		int boardResult = vService.insertVolBoard(vBoard);
		
		ArrayList<Attachment> list = new ArrayList<>();
		for(MultipartFile file : files) {
			if(!file.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(file, request);
				
				if(returnArr[1] != null) {
					Attachment attm = new Attachment();
					attm.setOriginalName(file.getOriginalFilename());
					attm.setRenameName(returnArr[1]);
					attm.setFileLink(returnArr[0]);
					
					list.add(attm);
				}
			}
		}
		
		int attmResult = 0;
		int imgResult = 0;
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			if(i == 0) {
				a.setLevel(0);
			} else {
				a.setLevel(1);
			}
			a.setFileType("Vol");
			attmResult += vService.insertAttm(a);
			imgResult += vService.insertImg();
		}
		
		if(boardResult + attmResult + imgResult == list.size()*2+3) {
			return "redirect:volBoardList.vo";
		} else {
			for(Attachment a : list) {
				deleteFile(a.getRenameName(), request);
			}
			throw new BoardException("봉사 게시글 작성 실패");
		}
	}

	private String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
		int ranNum = (int)(Math.random()*1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
											+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
