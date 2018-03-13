package com.jeong.haejwo.dao;

import com.jeong.haejwo.vo.UserInfoVO;

public interface UserInfoDAO {

	public UserInfoVO selectUserInfo(UserInfoVO ui);
	
	public int insertUserInfo(UserInfoVO ui);
}
