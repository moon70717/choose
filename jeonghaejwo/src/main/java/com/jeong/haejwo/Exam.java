package com.jeong.haejwo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Exam {

	static String u= "http://openapi.seoul.go.kr:8088/464c6c704f6d6f6f38396e43794e69/json/GetParkInfo/1/5/강남";
	public static void main(String[] args) {
		URL url = null;
	    HttpURLConnection conn = null;
	    String jsonData = "";
	    BufferedReader br = null;
	    StringBuffer sb = null;
	    String returnText = "";
	 
	    try {
	        url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?serviceKey=peWkmeOBUcoT4b1Oqd7%2FotBYLzAO%2BWBymO82ftCMolY%2Bs9AI1ppnNVO4U9a%2Blhohtj1X38Iy4ENC1ReL1aHKWg%3D%3D&numOfRoews=10&pageNo=1&startPage=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&contentTypeId=15&mapX=127.028900&mapY=37.496243&radius=500&listYN=Y");
	 
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
	    System.out.println(returnText);
	}
}
