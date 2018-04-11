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
	public @ResponseBody Map<String,Object> upload(HttpSession hs, MultipartHttpServletRequest multi) {
		
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
		System.out.println(id);
		
		//없으면 그냥 넘어가게
		if(file.getSize()==0)
			return null;
		try {
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
        
		//현재는 여기로 가게 해놓긴 했는데 @ResponseBody로 변경해야됨
		return null;
	}

}
