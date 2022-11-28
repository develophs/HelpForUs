package com.kh.HelpForUs.donBoard.model.vo;

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
public class DonBoard {
	
	private int boardId;
	private String boardType;
	private String refMemberUsername;
	private int refCategoryId;
	private String categoryName;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private Date boardDeadline;
	private String boardStatus;
	private String fundraisingGoalPrice;
	private int fundraisingCurrentPrice;
	private String managerName;
	private String managerPhone;
	private String memberNickname;
	private int boardCount;
}
