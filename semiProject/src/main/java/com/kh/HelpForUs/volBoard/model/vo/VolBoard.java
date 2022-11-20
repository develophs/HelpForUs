package com.kh.HelpForUs.volBoard.model.vo;

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
public class VolBoard {
	
	private int boardId;
	private String boardType;
	private String refMemberUsername;
	private int refCategoryId;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private Date boardDeadline;
	private String boardStatus;
	private int boardCount;
	private int volunteerGoalPeople;
	private int volunteerCurrentPeople;
	private String volunteerLocation;
	private Date volunteerDate;
	private String managerName;
	private String managerPhone;
	private String memberNickname;
	private String categoryName;
}
