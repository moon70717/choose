package com.jeong.haejwo.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.DefaultDAO;

@Component
@Qualifier("rank")
public class RankDAOImpl implements DefaultDAO {

	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public int insert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> selectList(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		List<Object> result= ss.selectList("rank.selectRankList");
		ss.close();
		return result;
	}

	@Override
	public int update(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
