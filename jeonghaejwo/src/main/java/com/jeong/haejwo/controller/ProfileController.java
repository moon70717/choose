package com.jeong.haejwo.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.service.DefaultService;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	private static final Logger log = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	@Qualifier("profile")
	DefaultService proService;
	
	@RequestMapping("/user")
	public @ResponseBody Map<String,Object> getUserProfile(@RequestParam Map<String,Object> data){
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("user", proService.getOne(data).get("result"));
		return result;
	}
	
	@RequestMapping("/insertFav")
	public @ResponseBody Map<String,Object> addFav(@RequestParam Map<String,Object> data){
		
		return null;
	}
	
	@RequestMapping("/fav")
	public @ResponseBody Map<String,Object> getFavList(@RequestParam Map<String,Object> data){
		
		return null;
	}
}
