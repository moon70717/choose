package com.jeong.haejwo.dao;

import java.util.Map;

public interface Tour_ApiDAO {

	String requestAPI(String u);
	
	int insertAPI(Map<String,Object> map);
}
