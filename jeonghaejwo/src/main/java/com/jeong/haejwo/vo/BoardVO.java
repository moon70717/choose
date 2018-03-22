package com.jeong.haejwo.vo;

public class BoardVO {
	
	/*CREATE TABLE board(
			boardNo int unsigned NOT NULL AUTO_INCREMENT,
			-- 해당 API에서 제공하는 고유번호
			userNo varchar(100) NOT NULL COMMENT '해당 API에서 제공하는 고유번호',
			boardtitle varchar(100)  NOT NULL,
			boardContent text(500) NOT NULL,
			regist datetime,
			hit double default '0',
			PRIMARY KEY (boardNo),
			UNIQUE (userNo)
		);*/
	
	
	private int boardNo;
	private String userNo;
	private String boardTitle;
	private String boardContent;
	private String regist;
	private int hit;
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", userNo=" + userNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", regist=" + regist + ", hit=" + hit + "]";
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getRegist() {
		return regist;
	}
	public void setRegist(String regist) {
		this.regist = regist;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
