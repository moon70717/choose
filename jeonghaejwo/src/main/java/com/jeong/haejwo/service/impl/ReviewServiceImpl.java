package com.jeong.haejwo.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.jeong.haejwo.dao.ReviewDAO;
import com.jeong.haejwo.service.ReviewService;

public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reDAO;
	
	@Override
	public int writeReview(Map<String, Object> data) {
		return reDAO.insertReview(data);
	}

}
