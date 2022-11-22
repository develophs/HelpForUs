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
public class Message {
	private int messageId;
	private Date messageCreateDate;
	private String messageTitle;
	private String messageContent;
	private String messageCheck;
	private String messageStatus;
	private String senderUsername;
	private String receiverUsername;
	private int refBoardId;
	private String boardType;
}
