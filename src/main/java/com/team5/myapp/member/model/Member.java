package com.team5.myapp.member.model;

import lombok.Data;

@Data
public class Member {
	private String userId;
	private String password;
	private String userName;
	private String phone;
	private String email;
	private int lectureId;
	private int role;
	private String lectureName;
	private String todayStatus;
}
