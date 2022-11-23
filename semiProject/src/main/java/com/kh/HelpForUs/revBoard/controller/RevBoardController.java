package com.kh.HelpForUs.revBoard.controller;

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
import com.kh.HelpForUs.revBoard.model.service.RevBoardService;
import com.kh.HelpForUs.revBoard.model.vo.RevBoard;
import com.kh.HelpForUs.volBoard.model.vo.VolBoard;

@Controller
public class RevBoardController {
	
	
	@Autowired
	private RevBoardService rService;
	
	
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
		
	
	
		
	@RequestMapping("witrerevBoardview.re")
	public String witrerevBoardview() {
		return "revBoardWrite";
	}
	
	
	//봉사 후기 작성페이지로 이동
	@RequestMapping("writeRevBoard.re")
	public String witrerevBoardview(HttpServletRequest request, @ModelAttribute VolBoard vBoard ,@RequestParam("file") ArrayList<MultipartFile> files) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberUsername();
		vBoard.setRefMemberUsername(id);
		int boardResult = rService.insertRevBoard(vBoard);
		
		ArrayList<Attachment> list = new ArrayList<>();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				System.out.println(fileType);
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("gpeg")) {
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
			a.setFileType("Rev");
			attmResult += rService.insertAttm(a);
			imgResult += rService.insertImg(0);
		}
		
		if(boardResult + attmResult + imgResult == list.size()*2+3) {
			return "redirect:revBoardList.re";
		} else {
			for(Attachment a : list) {
				deleteFile(a.getRenameName(), request);
			}
			throw new BoardException("봉사 게시글 작성 실패");
		}
	}
		
		

	@RequestMapping("volwitrerevBoardview.re")
	public String  volwitrerevBoardview() {
		return "volRevBoardWrite";
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
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	}


