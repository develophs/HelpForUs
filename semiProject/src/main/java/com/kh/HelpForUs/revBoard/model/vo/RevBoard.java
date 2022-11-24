package com.kh.HelpForUs.revBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class RevBoard {
	
	private int boardId;//게시글 번호
	private String boardType;// 게시판 이름
	private String refMemberUsername;//작성자
	private int refCategoryId;//카테고리 번호
	private String boardTitle;//제목
	private String boardContent;//내용	
	private Date boardCreateDate;//작성일
	private Date boardModifyDate;//수정일
	private String boardStatus;//상태
	private int boardCount; //후기 조회수
	private String categoryName;//카테고리이름
	private String volunteerGoalPeople;//봉사대상
	private String volunteerLocation;
	private Date volunteerDate;
	
}
