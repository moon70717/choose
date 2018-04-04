package com.jeong.haejwo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeong.haejwo.dao.impl.HistoryDAOImpl;
import com.jeong.haejwo.service.DefaultService;

@Controller
@RequestMapping("/history")
public class HistoryController {

	@Autowired
	@Qualifier("history")
	DefaultService hiService;
	
	@RequestMapping("/todo")
	public @ResponseBody Map<String,Object> getToDo(@RequestParam Map<String,Object> data){
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("result", hiService.getList(data));
		return result;
	}
	
	@RequestMapping("/todoIn")
	public @ResponseBody Map<String,Object> insertTodo(@RequestParam Map<String,Object> data){
		HistoryDAOImpl his=new HistoryDAOImpl();
		Map<String,Object> result=new HashMap<String,Object>();
		if(his.insert(data)==1) {
			result.put("result", true);
		}
		return result;
	}
}
