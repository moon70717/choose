package com.jeong.haejwo.dao;

import java.util.List;

import com.jeong.haejwo.vo.BoardVO;



public interface BoardDAO {

	public List<BoardVO>selectAll();
	public BoardVO selectBoard(BoardVO bo);
	public int insertBoard(BoardVO bo);
	public void incrementHit(BoardVO bo);
	public int updateBoard(BoardVO bo);
	public int deleteBoard(BoardVO bo);
	
	
	
}
