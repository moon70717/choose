package com.jeong.haejwo.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.DefaultDAO;

@Component
public class ProfileDAO implements DefaultDAO{

	@Autowired
	SqlSessionFactory ssf;
	
	
	//방문기록 저장용이긴한데 구분자를 하나 추가해서 다른 기능할수도 있도록 수정예정
	@Override
	public int insert(Map<String, Object> data) {
		SqlSession ss=ssf.openSession();
		int result=ss.insert("profile.history",data);
		ss.close();
		return result;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> data) {
		
		return null;
	}

	@Override
	public List<Object> selectList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
