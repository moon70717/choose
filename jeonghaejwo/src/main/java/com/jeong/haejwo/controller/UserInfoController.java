package com.jeong.haejwo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.service.UserInfoService;
import com.jeong.haejwo.vo.UserInfoVO;

@Controller
@RequestMapping("/user")
public class UserInfoController {
	@Autowired
	private UserInfoService uis;
	
	private static final Logger log = LoggerFactory.getLogger(UserInfoController.class);
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
											//받아온 값을 변수에 넣는거 @RequestParam
	public @ResponseBody Map<String, Object> login(@RequestParam Map<String, Object> data, HttpSession hs){
														         //UserInfoVO ui
		Map<String, Object> map = new HashMap<String, Object>();
		UserInfoVO ui=new UserInfoVO();//생성자 만들어서  setUserId,setUserPwd를 사용해서 data변수에 들어가있는 아이디랑 비번을 넣는다
		ui.setUserId((String) data.get("userId"));
		ui.setUserPwd((String) data.get("userPwd"));
		//값을 ui에 넣는 방법
		
		if(uis.login(map, ui)) {
			hs.setAttribute("user", map.get("user"));
		}
		return map;
	}
	
	
//	@RequestMapping(value="/join", method=RequestMethod.POST)
//	public @ResponseBody Map<String, Object> join(@RequestBody UserInfoVO ui){
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("msg", "회원가입 실패 임마~");
//		map.put("biz", false);
//		int result = uis.join(ui);
//		if(result==1) {
//			map.put("msg", "회원가입 성공 임마~");
//			map.put("biz", true);
//		}else if(result==2) {
//			map.put("msg", "아이디 중복 임마~");
//		}
//		return map;
//	}

	@RequestMapping(value="/check/{uiId}", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> join2(@PathVariable String uiId){
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("insertUI=>{}",uiId);
		map.put("msg", "아이디 중복 임마~");
		map.put("biz", false);
		if(uis.checkUserId(uiId)==0) {
			map.put("msg", "없는 아이디");
			map.put("biz", true);
		}
		return map;
	}
}
