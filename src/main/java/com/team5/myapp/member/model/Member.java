package com.team5.myapp.member.model;

public class Member {
	private String userId;
	private String password;
	private String userName;
	private String phone;
	private String email;
	private int lectureId;
	private int role;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLectureId() {
		return lectureId;
	}
	public void setLectureId(int lectureId) {
		this.lectureId = lectureId;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", phone=" + phone
				+ ", email=" + email + ", lectureId=" + lectureId + ", role=" + role + "]";
	}
	
}
