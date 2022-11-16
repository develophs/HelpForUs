package com.kh.HelpForUs.reply.model.vo;

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
public class Reply {
	private int replyId;
	private String replyContent;
	private Date replyModifyDate;
	private Date replyCreateDate;
	private String refMemberUsername;
	private int refBoardId;
	private String replyStatus;
}
