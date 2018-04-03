package com.jeong.haejwo.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.DefaultDAO;




@Repository
@Qualifier("user")
public class UserInfoDAOImpl implements DefaultDAO {
	@Autowired
	private SqlSessionFactory  ssf;

	@Override
	public int insert(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user.insertApiUser",data);
		ss.close();
		return result;
	}

	@Override
	public Map<String, Object> selectOne(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("user", ss.selectOne("user.selectApiUser",data));
		ss.close();
		return result;
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
