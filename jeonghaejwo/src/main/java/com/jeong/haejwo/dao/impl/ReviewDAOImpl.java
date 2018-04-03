package com.jeong.haejwo.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.DefaultDAO;

@Repository
@Qualifier("review")
public class ReviewDAOImpl implements DefaultDAO {

	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public List<Object> selectList(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		List<Object> result = ss.selectList("review.selectList",data);
		ss.close();
		return result;
	}

	@Override
	public int insert(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		int result=ss.insert("review.insertr",data);
		ss.close();
		return result;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}