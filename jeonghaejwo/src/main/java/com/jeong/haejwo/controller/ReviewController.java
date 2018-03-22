package com.jeong.haejwo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reService;

	@RequestMapping("/addComment")
	public @ResponseBody Map<String, Object> addComment(@RequestParam Map<String, Object> data, Map<String, Object> map, HttpSession hs) {
		int result= reService.writeReview(data);
		if(result==1) {
			map.put("result", "입력이 완료되었습니다");
		} else if(result==2) {
			map.put("result", "서버 에러가 감지되었습니다");
		} else if(result==0) {
			map.put("result", "입력실패");
		}
		return map;
	}
	
	@RequestMapping("/list")
	public @ResponseBody List<Map<String, Object>> getList(@RequestParam Map<String, Object> data, Map<String, Object> map, HttpSession hs){
		return reService.getList(data);
	}

}
