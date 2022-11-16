package com.kh.spring.board.model.vo;

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



public class Volwitreboard {

	private int refBoardId;
	private String volunteerGoalPeople;
	private String volunteerCurrentPeople;
	private String volunteerLocation;
	private Date volunteerDate;
}
