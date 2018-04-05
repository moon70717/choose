package com.jeong.haejwo.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.BoardDAO;
import com.jeong.haejwo.vo.BoardVO;

/*
 * private int idx; 
	private String userId;
	private String title;
	private String content;
	private String regist;
	private int hit;
 */

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sql;
	// private SqlSessionFactory ssf;

	// insert
	@Override
	public void insertBoard(BoardVO bo) {
		sql.insert("board.insertBoard", bo);

	}

	// update
	@Override
	public void updateBoard(BoardVO bo) {
		sql.update("board.updateBoard", bo);

	}

	// 조회수
	@Override
	public void incrementHit(BoardVO bo) {
		int idx = bo.getIdx();
		int count = sql.selectOne("board.getHit", idx);
		count++;
		bo.setHit(count);
		sql.update("board.updateBoardHit", bo);
	}

	// 삭제
	@Override
	public void deleteBoard(BoardVO bo) {
		sql.delete("board.deleteBoard", bo);

	}

	@Override
	public BoardVO selectBoard(int idx) {
		return sql.selectOne("board.selectBoard", idx);
	}

	@Override
	public List<BoardVO> selectAll() {

		return sql.selectList("board.getAll");
	}

	// @Override
	// public BoardVO selectBoard(BoardVO bo) {
	// SqlSession ss = ssf.openSession();
	// bo = ss.selectOne("board.selectBoard", bo);
	// ss.close();
	// return bo;
	// }
	//
	// @Override
	// public List<BoardVO> selectAll() {
	// SqlSession ss = ssf.openSession();
	// List<BoardVO> result = ss.selectList("board.selectBoardOrder");
	// ss.close();
	// return result;
	// }
	//
	// private int idx;
	// private String userId;
	// private String title;
	// private String content;
	// private String regist;
	// private int hit;
	//
	//
	// @Override
	// public void incrementHit(BoardVO bo) {
	// SqlSession ss=ssf.openSession();
	// String userId=bo.getUserId();
	// int count=ss.selectOne("board.selectBoardHit",userId);
	// count++;
	// bo.setHit(count);
	// ss.close();
	//
	// }
	//
	// @Override
	// public int insertBoard(BoardVO bo) {
	// SqlSession ss = ssf.openSession();
	// int result = ss.insert("board.insertBoard", bo);
	// ss.close();
	// return result;
	//
	// }
	//
	// @Override
	// public int updateBoard(BoardVO bo) {
	// SqlSession ss = ssf.openSession();
	// int result = ss.update("board.updateBoard", bo);
	// ss.close();
	// return result;
	//
	// }
	//
	// @Override
	// public int deleteBoard(BoardVO bo) {
	// SqlSession ss = ssf.openSession();
	// int result = ss.delete("board.deleteBoard", bo);
	// ss.close();
	// return result;
	//
	// }

}
