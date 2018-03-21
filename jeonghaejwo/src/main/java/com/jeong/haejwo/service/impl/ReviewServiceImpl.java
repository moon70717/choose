package com.jeong.haejwo.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeong.haejwo.dao.*;
import com.jeong.haejwo.service.*;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reDAO;
	
	@Override
	public int writeReview(Map<String, Object> data) {
		return reDAO.insertReview(data);
	}

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> data) {
		return reDAO.selectList(data);
	}

}
