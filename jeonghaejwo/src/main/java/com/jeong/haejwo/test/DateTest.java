package com.jeong.haejwo.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {

	public static void main(String[]args) {
		/*DateFormat outputFormat = new SimpleDateFormat("yyyy/MM/dd", Locale.US);
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSX", Locale.US);

		String inputText = "2012-11-17T00:00:00.000-05:00";
		java.util.Date date;
		try {
			date = inputFormat.parse(inputText);
			String outputText = outputFormat.format(date);
			System.out.println(outputText);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		String to = transFormat.format(from);

		System.out.println("돌아가냐?");
		System.out.println(to+"?");
	}
}
