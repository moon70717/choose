package com.jeong.haejwo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.jeong.haejwo.util.UploadObject;

@Controller
@RequestMapping("/file")
public class FileController {
	// 파일을 받은뒤 저장하는 곳
	@RequestMapping(value = "/upload")
	public @ResponseBody Map<String,Object> upload(HttpSession hs,MultipartHttpServletRequest multi) {
		
		//유저 코드를 받아오는부분
		//, @RequestParam("uiCode") String uiCode
		
		//년월일 으로 서버 날짜를 받아옴
		//이걸로 저장할거
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
		String dateS = transFormat.format(date);
		
		//파일받는부분
		Iterator<String> files = multi.getFileNames();
		String uploadFile = files.next();
		MultipartFile file =multi.getFile(uploadFile);
		
		//유저 정보 받아오는 부분
		String id=multi.getParameter("userId");
		System.out.println(multi.getParameter("userId"));
		System.out.println(multi.getParameter("test"));
		
		//없으면 그냥 넘어가게
		if(file.getSize()==0)
			return null;
		try {
			// aws 업로드시 주소변경필요
			// 또는 관리자 페이지를 만들어서 수정 가능하도록 변경
			// aws 업로드시 /media/회원코드/년월일.jpg 경로를 이렇게 변경
			InputStream is=file.getInputStream();
			ObjectMetadata metadata = new ObjectMetadata();
			UploadObject uploadObject = new UploadObject();
			String originName=file.getOriginalFilename();
			File convFile = new File(originName);
			
			file.transferTo(convFile);
			
			//s3는 기본적으로 폴더기반이 아니라 /만 붙여도 알아서 분리를 해줌
			uploadObject.upload(dateS+"/"+id+"/"+originName, is , metadata, convFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//이거써서 내용들 빼오면 될듯
        System.out.println("id : " + multi.getParameter("id"));
        
		//현재는 여기로 가게 해놓긴 했는데 @ResponseBody로 변경해야됨
		return null;
	}

}
