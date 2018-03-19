package com.jeong.haejwo.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeTest {

	public static void main(String[]args) {
		DateFormat dateFormat = new SimpleDateFormat("yyMMddHHmm");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
	}
}
