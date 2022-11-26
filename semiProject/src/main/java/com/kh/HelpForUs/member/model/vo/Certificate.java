package com.kh.HelpForUs.member.model.vo;

import com.kh.HelpForUs.common.vo.Attachment;

import lombok.Data;

@Data
public class Certificate {
	
	private Member member;
	private Attachment attachment;

}
