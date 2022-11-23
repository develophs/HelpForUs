package com.kh.HelpForUs.donBoard.controller;

import java.io.File;
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
		System.out.println(files);
		
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
		ArrayList<Attachment> list = new ArrayList<>();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			System.out.println(file.getOriginalFilename());
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				System.out.println(fileType);
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
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
		
		// 로직 2
		
		System.out.println(list);
//		dB.setBoardType("Don");
		int insAttmCount = 0;
		int insImgCount = 0;
		
		
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			if(i == 0) {
				a.setLevel(0);
			}else {
				a.setLevel(1);
			}
			a.setFileType("Don");
			insAttmCount += dService.insertAttm(a);
			insImgCount += dService.insertImg(0);
		}
		
		
		if(insBoardCount + insAttmCount + insImgCount == list.size()*2+3) {
			return "redirect:donBoardList.do";
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
	public ModelAndView selectDonBoard(@RequestParam("page") int page, @RequestParam("bId") int bId, @RequestParam("writer") String writer, HttpSession session, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		if(m != null) {
			login = m.getMemberNickname();
		}
		
		boolean yn = false;
		if(!writer.equals(login)) {
			yn = true;
		}
		
		DonBoard dB = dService.selectDonBoard(bId);
		ArrayList<Attachment> aList = dService.selectDonAttm(bId);
		
		if(dB != null) {
			mv.addObject("dB", dB).addObject("aList", aList).addObject("page", page).setViewName("boardDetailDon");
		}else {
			throw new BoardException("게시글 상세 조회 실패");
		}
		
		return mv;
	}
}
