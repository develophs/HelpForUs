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
public class Pay {
	private int payId;
	private String payPrice;
	private Date payDate;
	private String payStatus;
	private String refMemberUsername;
}
