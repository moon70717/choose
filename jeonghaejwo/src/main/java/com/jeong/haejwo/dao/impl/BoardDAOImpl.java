package com.jeong.haejwo.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.BoardDAO;
import com.jeong.haejwo.vo.BoardVO;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public BoardVO selectBoard(BoardVO bo) {
		SqlSession ss = ssf.openSession();
		bo = ss.selectOne("board.selectBoard", bo);
		ss.close();
		return bo;
	}

	@Override
	public List<BoardVO> selectAll() {
		SqlSession ss = ssf.openSession();
		List<BoardVO> result = ss.selectList("board.selectBoardOrder");
		ss.close();
		return result;
	}

	@Override
	public void incrementHit(BoardVO bo) {
		SqlSession ss=ssf.openSession();
		int boardNo=bo.getBoardNo();
		int count=ss.selectOne("board.selectBoardHit",boardNo);
		count++;
		bo.setHit(count);
	    ss.close();
	
	}

	@Override
	public int insertBoard(BoardVO bo) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("board.insertBoard", bo);
		ss.close();
		return result;

	}

	@Override
	public int updateBoard(BoardVO bo) {
		SqlSession ss = ssf.openSession();
		int result = ss.update("board.updateBoard", bo);
		ss.close();
		return result;

	}

	@Override
	public int deleteBoard(BoardVO bo) {
		SqlSession ss = ssf.openSession();
		int result = ss.delete("board.deleteBoard", bo);
		ss.close();
		return result;

	}

}
