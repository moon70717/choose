package com.jeong.haejwo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/file")
public class FileController {

	
	@RequestMapping(value="/upload")
	public String upload(MultipartHttpServletRequest multi){
		System.out.println("?");
		return "d";
	}
	
}
