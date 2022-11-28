package com.kh.HelpForUs.member.model.vo;

import com.kh.HelpForUs.common.vo.Board;
import com.kh.HelpForUs.common.vo.Cheer;

import lombok.Data;

@Data
public class CheerList {
	private Member member;
	private Cheer cheer;
	private Board board;
}
