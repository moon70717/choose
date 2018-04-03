package com.jeong.haejwo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.DefaultDAO;
import com.jeong.haejwo.service.DefaultService;

@Service
@Qualifier("review")
public class ReviewServiceImpl implements DefaultService {

	@Autowired
	@Qualifier("review")
	DefaultDAO reDAO;

	@Override
	public int insert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return reDAO.insert(data);
	}

	@Override
	public List<Object> getList(Map<String, Object> data) {
		return reDAO.selectList(data);
	}
	
	@Override
	public Map<String, Object> getOne(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
