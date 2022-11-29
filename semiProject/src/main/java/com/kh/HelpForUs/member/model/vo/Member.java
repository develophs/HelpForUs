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
public class Member {
	private String memberUsername;
	private String memberPwd;
	private String memberNickname;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberAddress;
	private int memberRose;
	private Date memberEnrollDate;
	private Date memberModifyDate;
	private String memberRight;
	private String memberStatus;
	private int donationRose;
}
