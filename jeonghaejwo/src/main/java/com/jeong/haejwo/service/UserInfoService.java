package com.jeong.haejwo.service;

import java.util.Map;

import com.jeong.haejwo.vo.UserInfoVO;

public interface UserInfoService {
	public boolean login(Map<String, Object> rMap, UserInfoVO ui);
	
	public int checkUserId(String userNo);
	
	public boolean login(Map<String,Object> data);
	
	public Map<String,Object> getUser(Map<String,Object> data);
}
