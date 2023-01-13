package com.team5.myapp.member.model;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date attendanceDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="HH:mm:ss",timezone="Asia/Seoul")
	private Timestamp clockIn;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="HH:mm:ss",timezone="Asia/Seoul")
	private Timestamp clockOut;
}
