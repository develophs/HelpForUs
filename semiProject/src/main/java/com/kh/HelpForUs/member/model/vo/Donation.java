package com.kh.HelpForUs.member.model.vo;

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
public class Donation {
	private int donationId;
	private String donationPrice;
	private Date donationDate;
	private int refBoardId;
	private String refMemberUsername;
}
