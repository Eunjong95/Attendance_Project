package com.team5.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Attendance {
	private int attendanceId;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date attendanceDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="HH:mm:ss",timezone="Asia/Seoul")
	private Timestamp clockIn;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="HH:mm:ss",timezone="Asia/Seoul")
	private Timestamp clockOut;
	private int status;
	private String userId;
	
}
