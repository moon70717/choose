package com.jeong.haejwo.dao.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Component;

import com.jeong.haejwo.dao.Tour_ApiDAO;

@Component
public class Tour_ApiDAOImpl implements Tour_ApiDAO {

	@Override
	public String requestAPI(String u) {
		URL url = null;
	    HttpURLConnection conn = null;
	    String jsonData = "";
	    BufferedReader br = null;
	    StringBuffer sb = null;
	    String returnText = "";
	    
	    try {
	        url = new URL(u);
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setRequestMethod("GET");
	        conn.connect();
	 
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	 
	        sb = new StringBuffer();
	 
	        while ((jsonData = br.readLine()) != null) {
	            sb.append(jsonData);
	        }
	        returnText = sb.toString();
	 
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (br != null) br.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return returnText;
	}

}
