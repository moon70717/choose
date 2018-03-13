package com.jeong.haejwo.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeong.haejwo.dao.UserInfoDAO;
import com.jeong.haejwo.service.UserInfoService;
import com.jeong.haejwo.vo.UserInfoVO;




@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO uidao;
	
	@Override
	public boolean login(Map<String, Object> rMap, UserInfoVO ui) {
		ui = uidao.selectUserInfo(ui);
		rMap.put("msg", "아이디 비밀번호를 확인해주세요.");
		rMap.put("biz", false);
		if(ui!=null) {
			rMap.put("msg", ui.getUserName() + "님 로그인에 성공하셨습니다.");
			rMap.put("biz", true);
			return true;
		}
		return false;
	}

	public int checkUserId(String userId) {
		UserInfoVO ui = new UserInfoVO();
		ui.setUserId(userId);
		if(uidao.selectUserInfo(ui)!=null){
			return 1;
		}
		return 0;
	}
	
//	@Override
//	public int join(UserInfoVO ui) {
//		if(checkUserId(ui.getUserId())==1) {
//			return 2;
//		}
//		return uidao.insertUserInfo(ui);
//	}

}
