package com.jeong.haejwo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.service.Tour_ApiService;

@Controller
@RequestMapping("/api")
public class ApiController {

	@Autowired
	Tour_ApiService tourService;
	
	//여기서 현재위치, 카테고리, 반경설정을 받아와서 서비스에 넘기도록 수정해야됨
	@RequestMapping("/tour_api")
	public @ResponseBody Map<String,Object> getPath(Map<String, Object> map, HttpSession hs){
		map.put("json", tourService.requestAPI(null, null));
		return map;
	}
	
	@RequestMapping("/test")
	public @ResponseBody Map<String,Object> test(Map<String, Object> map, HttpSession hs){
		System.out.println(map);
		System.out.println(hs.getAttribute("data"));;
		System.out.println("온거");
		return map;
	}
	
}
