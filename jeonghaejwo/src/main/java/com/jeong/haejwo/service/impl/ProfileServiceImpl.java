package com.jeong.haejwo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.DefaultDAO;
import com.jeong.haejwo.service.DefaultService;

@Service
@Qualifier("profile")
public class ProfileServiceImpl implements DefaultService{

	@Autowired
	@Qualifier("profile")
	DefaultDAO proDAO;
	
	@Override
	public int insert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> data) {
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("result", proDAO.selectList(data));
		return result;
	}

	@Override
	public List<Object> getList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
