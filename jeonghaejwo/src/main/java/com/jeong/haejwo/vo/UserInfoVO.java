package com.jeong.haejwo.vo;

public class UserInfoVO {
	private String userId;
	private String userName;
	private String ImageURL;	
	private String Email;
	@Override
	public String toString() {
		return "UserInfoVO [userId=" + userId + ", userName=" + userName + ", ImageURL=" + ImageURL + ", Email=" + Email
				+ "]";
	}
	public String getuserId() {
		return userId;
	}
	public void setuserId(String userId) {
		this.userId = userId;
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
