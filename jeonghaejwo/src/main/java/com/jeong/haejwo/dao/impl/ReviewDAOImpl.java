package com.jeong.haejwo.dao.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeong.haejwo.dao.ReviewDAO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionFactory ssf;
	
	@Override
	public int insertReview(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		ReviewDAO re=new ReviewDAOImpl();
		if(re.vaildReview(data)==1) {
			return ss.insert("review.insertr",data);
		}
		return 2;
	}

	@Override
	public int vaildReview(Map<String, Object> data) {
		SqlSession ss = ssf.openSession();
		if(ss.selectOne("",data)==null) {
			return 1;
		}
		return 0;
	}

}