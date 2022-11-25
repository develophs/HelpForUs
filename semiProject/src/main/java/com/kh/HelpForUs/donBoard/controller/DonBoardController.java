package com.kh.HelpForUs.donBoard.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.kh.HelpForUs.member.model.vo.Member;

@Controller
public class DonBoardController {
	
	@Autowired
	private DonBoardService dService;
	
	// 모금 게시글 리스트
	@RequestMapping("donBoardList.do")
	public String donBoardList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) Integer category, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int cate = 0;
		if(category != null && category > 0 && category < 7) {
			cate = category;
		}
		
		int dListCount = dService.getDonListCount(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, dListCount, 9);
		
		ArrayList<DonBoard> dList = dService.selectDonList(pi, cate);
		ArrayList<Attachment> aList = dService.selectAttmList();
		
		if(dList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("dList", dList);
			model.addAttribute("aList", aList);
			model.addAttribute("cate", cate);
			
			return "boardListDon";
		}else {
			throw new BoardException("게시글 조회 실패");
		}
	}	
	
	// 모금 글 작성 페이지로 넘어가기
	@RequestMapping("donBoardWrite.do")
	public String donBoardWrite() {
		return "donBoardWrite";
	}
	
	// 모금 글 작성하기
	@RequestMapping("insertDonBoard.do")
	public String insertDonBoard(HttpServletRequest request, @ModelAttribute DonBoard dB, @RequestParam("file") ArrayList<MultipartFile> files) {
		String donBoardWriter = ((Member)request.getSession().getAttribute("loginUser")).getMemberUsername();
		dB.setRefMemberUsername(donBoardWriter);
		int insBoardCount = dService.insertDonBoard(dB);
//		System.out.println(files);
		
		// 로직1
//		ArrayList<Attachment> list = new ArrayList<Attachment>();
//		for(int i = 0; i < files.size(); i++) {
//			MultipartFile upload = files.get(i);
//			
//			if(!upload.getOriginalFilename().equals("")) {
//				String[] returnArr = saveFile(upload, request);
//				
//				if(returnArr[1] != null) {
//					Attachment a = new Attachment();
//					a.setOriginalName(upload.getOriginalFilename());
//					a.setRenameName(returnArr[1]);
//					a.setFileLink(returnArr[0]);
//					
//					list.add(a);
//				}
//			}
//		}
		ArrayList<Attachment> fList = new ArrayList<>();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
//			System.out.println(file.getOriginalFilename());
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
//				System.out.println(fileType);
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
					String[] returnArr = saveFile(file, request);
					
					if(returnArr[1] != null) {
						Attachment attm = new Attachment();
						attm.setOriginalName(file.getOriginalFilename());
						attm.setRenameName(returnArr[1]);
						attm.setFileLink(returnArr[0]);
						
						fList.add(attm);
					}
				}
			}
		}
		
		// 로직 2
//		System.out.println(list);
//		dB.setBoardType("Don");
		int insAttmCount = 0;
		int insImgCount = 0;
		
		
		ArrayList<Attachment> list = new ArrayList<>();
		for(int i = 0; i < fList.size(); i++) {
			Attachment a = fList.get(i);
			if(i == 0) {
				a.setLevel(0);
			}else {
				a.setLevel(1);
			}
			
			if(dB.getBoardType().equals("Don")) {
				a.setFileType("Don");
			}else {
				a.setFileType("donRev");
			}
			
			insAttmCount += dService.insertAttm(a);
			insImgCount += dService.insertImg(0);
		}
		
		// 한 번에 넣을 수 있게 바꿔주기
		
		System.out.println(insBoardCount);
		System.out.println(insAttmCount);
		System.out.println(insImgCount);
		System.out.println(fList.size());
		if(insBoardCount + insAttmCount + insImgCount == fList.size()+fList.size()+3) {
			
			if(dB.getBoardType().equals("Don")) {
				return "redirect:donBoardList.do";
			} else{
				return "redirect:revBoardList.re";
			}
			
			
		}else {
			for(Attachment a : list) {
				deleteFile(a.getRenameName(), request);
			}
			throw new BoardException("기부 게시글 작성 실패");
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
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
		
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
	
	@RequestMapping("selectDonBoard.do")
	public ModelAndView selectDonBoard(@RequestParam("bId") int bId, @RequestParam(value="writer", required=false) String writer, HttpSession session, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		boolean bool = false;
		if(m != null && writer != null) {
			login = m.getMemberNickname();
			if(!writer.equals(login)) {
				bool = true;
			}
		}
		
		// 응원 내역 보기 위한 것
		Cheer c = new Cheer();
		Cheer cheer = null;
		System.out.println("DonCont m : " + m);
		if(m != null) {
			c.setBoardId(bId);
			c.setMemberUserName(m.getMemberUsername());
			System.out.println("DonCont c : " + c);
			cheer = dService.cheer(c);
			
		}
		System.out.println("DonCont cheer2 : " + cheer);
		DonBoard dB = dService.selectDonBoard(bId, bool);
		ArrayList<Attachment> aList = dService.selectDonAttm(bId);
		
		if(dB != null) {
			if(dB.getBoardType().equals("Don")) {
				mv.addObject("dB", dB).addObject("aList", aList).addObject("cheer", cheer).setViewName("boardDetailDon");
			}else {
				mv.addObject("dB", dB).addObject("aList", aList).addObject("cheer", cheer).setViewName("../revBoard/donRevDetail");
			}
			
		}else {
			throw new BoardException("게시글 상세 조회 실패");
		}
		
		return mv;
	}
	
	// 응원하기
	@RequestMapping("cheerBoard.do")
	public String cheerBoard(HttpSession session, @RequestParam("bId") int boardId, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		
		Cheer cheerUp = new Cheer(boardId, id);
		
		int result = dService.cheerUp(cheerUp);
		
		if(result > 0) {
			model.addAttribute("bId", boardId);
			return "redirect:selectDonBoard.do";
		}else {
			throw new BoardException("응원하기 실패");
		}
	}
	
	// 응원하기 취소
	@RequestMapping("cheerCancle.do")
	public String cheerCancle(HttpSession session, @RequestParam("bId") int bId, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberUsername();
		
		Cheer cheerUp = new Cheer(bId, id);
		
		int cheerCancle = dService.cheerCancle(cheerUp);
		
		if(cheerCancle > 0) {
			model.addAttribute("bId", bId);
			return "redirect:selectDonBoard.do";
		}else {
			throw new BoardException("응원하기 취소 실패");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
