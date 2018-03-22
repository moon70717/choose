package com.jeong.haejwo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeong.haejwo.dao.BoardDAO;
import com.jeong.haejwo.vo.BoardVO;



@Controller
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardDAO bdao;

	@RequestMapping(value = "GetList", method = RequestMethod.GET)
	public String outList(Model model) {
		log.info("게시판 첫 페이지");
		List<BoardVO> board = bdao.selectAll();
		model.addAttribute("board", board);

		return "board/board";
	}
	
	@RequestMapping(value="Get",method=RequestMethod.GET)
	public String getBoard(Model model,@RequestParam("boardNo")BoardVO boardNo) {
		log.info("게시물 클릭");
		BoardVO board=bdao.selectBoard(boardNo);
		bdao.incrementHit(board);
		model.addAttribute("board",board);
		return "board/boardContent";
	}
	
	@RequestMapping(value="WriteForm")
	public String writeForm() {
		log.info("게시물작성 클릭");
		return "board/boardWrite";
	}
	
	@RequestMapping(value="Write",method=RequestMethod.POST)
	public void wirte(Model model,BoardVO board,HttpServletRequest req, HttpServletResponse res) throws IOException {
		log.info("작성");
		HttpSession session =req.getSession();
		String userNo=(String) session.getAttribute("userNo");
		board.setUserNo("userNo");
		bdao.insertBoard(board);
		res.sendRedirect("GetList");
	}
	
	@RequestMapping(value="Delete",method=RequestMethod.GET)
	public String delete(Model model,@RequestParam("boardNo")BoardVO boardNo) {
		log.info("게시물 삭제");
		bdao.deleteBoard(boardNo);
		List<BoardVO>board=bdao.selectAll();
		model.addAttribute("board",board);
		return "board/board";
	}
	
	@RequestMapping(value="Update",method=RequestMethod.POST)
	public String update(Model model,BoardVO reqBoard) {
		bdao.updateBoard(reqBoard);
		List<BoardVO>board=bdao.selectAll();
		model.addAttribute("board",board);
		return "board/board";
	}
	@RequestMapping(value="UpdateForm", method=RequestMethod.GET)
	public String updateForm(Model model,@RequestParam("boardNo")BoardVO boardNo) {
		BoardVO board=bdao.selectBoard(boardNo);
		return "board/boardUpdate";
		
	}

}
