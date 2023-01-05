package com.team5.myapp.attendance.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Attendance {
	private int attendanceId;
	private Date attendanceDate;
	private Timestamp clockIn;
	private Timestamp clockOut;
	private int status;
	private String userId;
	
	public int getAttendanceId() {
		return attendanceId;
	}
	public void setAttendanceId(int attendanceId) {
		this.attendanceId = attendanceId;
	}
	public Date getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public Timestamp getClockIn() {
		return clockIn;
	}
	public void setClockIn(Timestamp clockIn) {
		this.clockIn = clockIn;
	}
	public Timestamp getClockOut() {
		return clockOut;
	}
	public void setClockOut(Timestamp clockOut) {
		this.clockOut = clockOut;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Attendance [attendanceId=" + attendanceId + ", attendanceDate=" + attendanceDate + ", clockIn="
				+ clockIn + ", clockOut=" + clockOut + ", status=" + status + ", userId=" + userId + "]";
	}
	
}
