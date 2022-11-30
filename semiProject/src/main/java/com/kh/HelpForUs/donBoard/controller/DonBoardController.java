package com.kh.HelpForUs.donBoard.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.HelpForUs.common.exception.BoardException;
import com.kh.HelpForUs.common.vo.Attachment;
import com.kh.HelpForUs.common.vo.Cheer;
import com.kh.HelpForUs.common.vo.Image;
import com.kh.HelpForUs.common.vo.PageInfo;
import com.kh.HelpForUs.common.vo.Pagination;
import com.kh.HelpForUs.common.vo.Reply;
import com.kh.HelpForUs.donBoard.model.service.DonBoardService;
import com.kh.HelpForUs.donBoard.model.vo.DonBoard;
import com.kh.HelpForUs.member.model.service.MemberService;
import com.kh.HelpForUs.member.model.vo.Donation;
import com.kh.HelpForUs.member.model.vo.Member;
import com.kh.HelpForUs.revBoard.model.service.RevBoardService;

@Controller
public class DonBoardController {
	
	@Autowired
	private DonBoardService dService;
	
	@Autowired
	private RevBoardService rService;
	
	@Autowired
	private MemberService mService;
	
	// 모금 게시글 리스트
	@RequestMapping("donBoardList.do")
	public String donBoardList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) Integer category, Model model, @RequestParam(value="search", required=false) String search) {
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
		HashMap<String, Object> map = new HashMap<>();
		map.put("cate", cate);
		map.put("search", search);
		
		ArrayList<DonBoard> dList = dService.selectDonList(pi, map);
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
	
	// 모금 글 작성 페이지 이동
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
		System.out.println(dB);
		
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
						
						list.add(attm);
					}
				}
			}
		}
		
		// 로직 2
//		System.out.println(list);
//		dB.setBoardType("Don");
//		int insAttmCount = 0;
//		int insImgCount = 0;
		
		int insAttmCount = 0;
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			if(i == 0) {
				a.setLevel(0);
			}else {
				a.setLevel(1);
			}
			a.setFileType("Don");
		}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("bId", 0);
			
//			System.out.println(list);
			if(!list.isEmpty()) {
				insAttmCount = dService.insertAttm(map);
			}
			
//			System.out.println(insBoardCount);
//			System.out.println(insAttmCount);
			if(insBoardCount + insAttmCount == list.size()*2+3) {
				if(dB.getBoardType().equals("Don")) {
					return "redirect:donBoardList.do";
				}else {
					return "redirect:revBoardList.re";
				}
				
				
				
			} else {
				for(Attachment a : list) {
					deleteFile(a.getRenameName(), request);
				}
				throw new BoardException("기부 게시글 작성 실패");
			}
		}
		
//		System.out.println(insBoardCount);
//		System.out.println(insAttmCount);
//		System.out.println(insImgCount);
//		System.out.println(fList.size());
		
	
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
	public ModelAndView selectDonBoard(@RequestParam("bId") Integer bId, @RequestParam(value="writer", required=false) String writer, HttpSession session, ModelAndView mv, @ModelAttribute DonBoard dFund) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		boolean bool = false;
		if(m != null && writer != null) {
			login = m.getMemberNickname();
			if(!writer.equals(login)) {
				bool = true;
			}
		}
		// 응원 내역 보기
		Cheer c = new Cheer();
		Cheer cheer = null;
		if(m != null) {
			c.setBoardId(bId);
			c.setMemberUserName(m.getMemberUsername());
			cheer = dService.cheer(c);
		}
		DonBoard dB = dService.selectDonBoard(bId, bool);
		ArrayList<Attachment> aList = dService.selectDonAttm(bId);
		
		
		// 댓글
		Reply r = new Reply();
		ArrayList<Reply> reply = null;
		r.setRefBoardId(bId);
		reply = dService.selectReply(r);
		
		if(dB != null) {
			if(dB.getBoardType().equals("Don")) {
				mv.addObject("dB", dB).addObject("aList", aList).addObject("cheer", cheer).addObject("reply", reply).addObject("dFund", dFund).setViewName("boardDetailDon");
			}else {
				mv.addObject("dB", dB).addObject("aList", aList).addObject("cheer", cheer).addObject("reply", reply).setViewName("../revBoard/donRevDetail");
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
			throw new BoardException("응원 취소 실패");
		}
	}
	
	// 장미 기부하기
	@RequestMapping("roseDonation.do")
	public String roseDonation(HttpSession session, @RequestParam("bId") int bId, @RequestParam("writer") String writer ,@RequestParam("reply") String reply, Model model, @RequestParam("totalRose") String totalRose, @ModelAttribute DonBoard dB) {
		Member mem = ((Member)session.getAttribute("loginUser"));
		String id = mem.getMemberUsername();

		
		//		int currRose = ((Member)session.getAttribute("loginUser")).getMemberRose();
		int currRose = dService.selectCurrRose(id);
		
//		System.out.println(bId);
		Donation don = new Donation();
		don.setRefMemberUsername(id);
		don.setRefBoardId(bId);
		don.setDonationPrice(totalRose);
//		System.out.println(bId);
		int donResult = dService.breakdownDon(don);
		
//		System.out.println(currRose);
//		System.out.println(totalRose);
		Member m = new Member();
		m.setMemberRose(currRose-Integer.parseInt(totalRose));
//		System.out.println(currRose-Integer.parseInt(totalRose));
		m.setMemberUsername(id);
//		System.out.println(m.getMemberUsername());
		int roseUpdate = dService.roseDonation(m);
		
		DonBoard dFund = new DonBoard();
		int currPrice = 0;
		currPrice += (Integer.parseInt(totalRose)*100);
		currPrice += dB.getFundraisingCurrentPrice();
		
//		System.out.print(currPrice);
		dFund.setFundraisingCurrentPrice(currPrice);
		dFund.setBoardId(bId);
		int fundraisingUpdate = dService.fundraisingUpdate(dFund);
		
		if(reply.equals("")) {
			reply = "응원합니다!";
		}
		
		
		Reply r = new Reply();
		r.setRefMemberUsername(id);
		r.setRefBoardId(bId);
		r.setReplyContent(reply);
		int replyIns = dService.replyInsert(r);
		
		if(donResult > 0) {
			model.addAttribute("currPrice", currPrice);
			Member loginUser = mService.login(mem);
			session.setAttribute("loginUser", loginUser);
			return "redirect:selectDonBoard.do?bId="+bId +"&writer="+writer + "&page=1";
			
		}else {
			throw new BoardException("기부하기 실패");
		}
	}
	
	// 모금 게시글 삭제
	@RequestMapping("deleteDonBoard.do")
	public String deleteDonBoard(@RequestParam("bId") int bId,@RequestParam(value="boardType", required = false) String boardType) {
		int result = dService.deleteDonBoard(bId);
		result += dService.deleteAttmStatus(bId);
		if(result > 0) {
			if(boardType.equals("donRev")) {
				return "redirect:revBoardList.re";
			}else {
				return "redirect:donBoardList.do";
			}
			
		}else {
			throw new BoardException("모금 게시글 삭제 실패");
		}
	}
	
	// 모금 게시글 수정 페이지 이동
	@RequestMapping("goUpdateDonBoard.do")
	public String goUpdateDonBoard(@RequestParam("bId") int bId, Model model) {
		DonBoard dB = dService.selectDonBoard(bId, false);
		ArrayList<Attachment> list = dService.selectDonAttm(bId);
		model.addAttribute("dB", dB);
		model.addAttribute("list", list);
		return "donBoardEdit";
	}
	
	// 모금 게시글 수정
	@RequestMapping("updateDonBoard.do")
	public String updateDonBoard(@ModelAttribute DonBoard dB, @RequestParam("deleteAttm") String[] deleteAttm, @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request, Model model) {
		System.out.println(dB);
		System.out.println(Arrays.toString(deleteAttm));
		System.out.println(files);
		
		int result = dService.updateDonBoard(dB);
		
		
		ArrayList<Attachment> list = new ArrayList<>();
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
						
						list.add(attm);
					}
				}
			}
		}
		
		// ?�택?? ?�일?? ??��
		ArrayList<String> delRename = new ArrayList<>();
		ArrayList<Integer> delLevel = new ArrayList<>();
		for(String rename : deleteAttm) {
			if(!rename.equals("")) {
				System.out.println(rename);
				String[] split = rename.split("/");
				delRename.add(split[0]);
				delLevel.add(Integer.parseInt(split[1]));
				Image img = new Image(dB.getBoardId(), Integer.parseInt(split[2]));
				dService.deleteImage(img);
			}
		}
		
		System.out.println(delRename);
		int deleteAttmResult = 0;
		boolean existBeforeAttm = true;  // ?�?�했?? 첨�??�일 �? ?�나?�도 ??��?�겠?�고 ?? 경우
		if(!delRename.isEmpty()) {
			deleteAttmResult = dService.deleteAttm(delRename);
			if(deleteAttmResult > 0) {
				for(String rename : delRename) {
					deleteFile(rename, request);
				}
			}
			
			if(delRename.size() == deleteAttm.length) { // 기존 ?�일?? ?��? ??��?�겠?�고 ?? 경우
				existBeforeAttm = false;
			} else {
				for(int level : delLevel) {
					if(level == 0) {
						dService.updateAttmLevel(dB.getBoardId());
						break;
					}
				}
			}
		}
		if(deleteAttm == null) {
			existBeforeAttm = false;
		}
		
		for(int i = 0; i <list.size(); i++) {
			Attachment a = list.get(i);
			
			if(existBeforeAttm) {
				a.setLevel(1);
			}else {
				if(i == 0) {
					a.setLevel(0);
				}else {
					a.setLevel(1);
				}
			}
			a.setFileType("Don");
		}
		
		int updateAttmResult = 0;
		if(!list.isEmpty()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("bId", dB.getBoardId());
			updateAttmResult = dService.insertAttm(map);
		}
		
//		System.out.println(result);
//		System.out.println(updateAttmResult);
//		System.out.println(list);
		if(result + updateAttmResult == list.size()*2+1) {
			if(delRename.size() == deleteAttm.length && updateAttmResult == 0) {
				return "redirect:donBoardDetail.do";
			}else {
//				return "redirect:selectAttm.at?bId=" + b.getBoardId() + "&writer=" + ((Member)request.getSession().getAttribute("loginUser")).getNickName() + "&page=" + page;
				model.addAttribute("bId", dB.getBoardId());
				model.addAttribute("writer", ((Member)request.getSession().getAttribute("loginUser")).getMemberNickname());
				return "redirect:selectDonBoard.do";
			}
		}else {
			throw new BoardException("모금 게시글 수정 실패");
		}
	}
	
	
	
	
	
	
	
	
	
	
}
