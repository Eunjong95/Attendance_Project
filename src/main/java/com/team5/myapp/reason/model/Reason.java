package com.team5.myapp.reason.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Reason {
	private int reasonId;
	private String reasonContent;
	private Date reasonDate;
	private Date reasonWriteDate;
	private String userId;
	private int reasonCategoryId;
	private int attendanceId;
	private int reasonStatus;
	private MultipartFile files;
	private String reasonFileName;
	private long reasonFileSize;
	private String reasonFileContentType;
	private byte[] reasonFileData;

	public int getReasonId() {
		return reasonId;
	}

	public MultipartFile getFiles() {
		return files;
	}

	public void setFiles(MultipartFile files) {
		this.files = files;
	}

	public void setReasonId(int reasonId) {
		this.reasonId = reasonId;
	}

	public String getReasonContent() {
		return reasonContent;
	}

	public void setReasonContent(String reasonContent) {
		this.reasonContent = reasonContent;
	}

	public Date getReasonDate() {
		return reasonDate;
	}

	public void setReasonDate(Date reasonDate) {
		this.reasonDate = reasonDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReasonCategoryId() {
		return reasonCategoryId;
	}

	public void setReasonCategoryId(int reasonCategoryId) {
		this.reasonCategoryId = reasonCategoryId;
	}

	public int getAttendanceId() {
		return attendanceId;
	}

	public void setAttendanceId(int attendanceId) {
		this.attendanceId = attendanceId;
	}

	public int getReasonStatus() {
		return reasonStatus;
	}

	public void setReasonStatus(int reasonStatus) {
		this.reasonStatus = reasonStatus;
	}

	public String getReasonFileName() {
		return reasonFileName;
	}

	public void setReasonFileName(String reasonFileName) {
		this.reasonFileName = reasonFileName;
	}

	public long getReasonFileSize() {
		return reasonFileSize;
	}

	public void setReasonFileSize(long reasonFileSize) {
		this.reasonFileSize = reasonFileSize;
	}

	public String getReasonFileContentType() {
		return reasonFileContentType;
	}

	public void setReasonFileContentType(String reasonFileContentType) {
		this.reasonFileContentType = reasonFileContentType;
	}

	public byte[] getReasonFileData() {
		return reasonFileData;
	}

	public void setReasonFileData(byte[] reasonFileData) {
		this.reasonFileData = reasonFileData;
	}

	public Date getReasonWriteDate() {
		return reasonWriteDate;
	}

	public void setReasonWriteDate(Date reasonWriteDate) {
		this.reasonWriteDate = reasonWriteDate;
	}

	@Override
	public String toString() {
		return "Reason [reasonId=" + reasonId + ", reasonContent=" + reasonContent + ", reasonDate=" + reasonDate
				+ ", reasonWriteDate=" + reasonWriteDate + ", userId=" + userId + ", reasonCategoryId="
				+ reasonCategoryId + ", attendanceId=" + attendanceId + ", reasonStatus=" + reasonStatus
				+ ", reasonFileName=" + reasonFileName + ", reasonFileSize=" + reasonFileSize
				+ ", reasonFileContentType=" + reasonFileContentType + "]";
	}

}
