package com.jeong.haejwo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/list")
public class ListController {

	@RequestMapping("/list")
	public @ResponseBody Map<String,Object> getList(@RequestParam()Map<String,Object> data){
		
		return null;
	}
}
