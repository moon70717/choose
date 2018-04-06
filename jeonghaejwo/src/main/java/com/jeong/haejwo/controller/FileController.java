package com.jeong.haejwo.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class FileController {
	// 파일을 받은뒤 저장하는 곳
	@RequestMapping(value = "/upload")
	public String upload(@RequestParam("uploadFile") MultipartFile file,
			HttpServletRequest request, Model model) {
		
		//유저 코드를 받아오는부분
		//, @RequestParam("uiCode") String uiCode
		
		//년월일시분 으로 서버 날짜를 받아옴
		//이걸로 저장할거
		/*DateFormat dateFormat = new SimpleDateFormat("yyMMddHHmm");
		Date date = new Date();*/
		//System.out.println(dateFormat.format(date));
		
		//없으면 그냥 넘어가게
		if(file.getSize()==0)
			return "/test";
		try {
			// aws 업로드시 주소변경필요
			// 또는 관리자 페이지를 만들어서 수정 가능하도록 변경
			// aws 업로드시 /media/회원코드/년월일.jpg 경로를 이렇게 변경
			File f = new File(".\\resources\\imgs\\" + file.getOriginalFilename());
			file.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//현재는 여기로 가게 해놓긴 했는데 @ResponseBody로 변경해야됨
		return "/test";
	}

}
