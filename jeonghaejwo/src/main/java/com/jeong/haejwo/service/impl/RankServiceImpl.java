package com.jeong.haejwo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.DefaultDAO;
import com.jeong.haejwo.service.DefaultService;

@Service
@Qualifier("rank")
public class RankServiceImpl implements DefaultService {

	@Autowired
	@Qualifier("rank")
	DefaultDAO ranDAO;
	
	/*@Override
	public Map<String, Object> getRank() {
		Map<String, Object> a=null;
		return (Map<String, Object>) ranDAO.selectList(a).get(0);
	}*/

	@Override
	public int insert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getOne(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getList(Map<String, Object> data) {
		Map<String, Object> a=null;
		return ranDAO.selectList(a);
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
