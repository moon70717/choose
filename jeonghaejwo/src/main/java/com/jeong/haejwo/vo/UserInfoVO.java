package com.jeong.haejwo.vo;

public class UserInfoVO {
	private String userNo;
	private String userName;
	private String ImageURL;	
	private String Email;
	@Override
	public String toString() {
		return "UserInfoVO [userNo=" + userNo + ", userName=" + userName + ", ImageURL=" + ImageURL + ", Email=" + Email
				+ "]";
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getImageURL() {
		return ImageURL;
	}
	public void setImageURL(String imageURL) {
		ImageURL = imageURL;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	
	
}
