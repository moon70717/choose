package com.jeong.haejwo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/list")
public class ListController {
//@RequestParam()Map<String,Object> data
	@RequestMapping("/all")
	public @ResponseBody List<Object> getList(){
		Map<String,Object> result=new HashMap<String,Object>();
		List<Object> in=new ArrayList<Object>();
		result.put("userNo", "1");
		result.put("code", "1");
		result.put("point", 1);
		result.put("comment", "1");
		result.put("date", "1998-08-03");
		result.put("contenttypeid", "1");
		result.put("placename", "1");
		result.put("imgNo", null);
		in.add(result);
		
		result=new HashMap<String,Object>();
		result.put("userNo", "2");
		result.put("code", "2");
		result.put("point", 2);
		result.put("comment", "2");
		result.put("date", "1998-08-03");
		result.put("contenttypeid", "2");
		result.put("placename", "2");
		result.put("imgNo", null);
		in.add(result);
		return in;
	}
	
	@RequestMapping("/re")
	public @ResponseBody List<Object> reList(@RequestParam Map<String, Object> data){
		int num=Integer.parseInt((String) data.get("num"));
		Map<String,Object> temp=new HashMap<String,Object>();
		List<Object> result=new ArrayList<Object>();
		for(int i=num;i<num+10;i++) {
			temp=new HashMap<String,Object>();
			temp.put("userNo", i);
			temp.put("re", "테스트중");
			result.add(temp);
		}
		return result;
	}
}
