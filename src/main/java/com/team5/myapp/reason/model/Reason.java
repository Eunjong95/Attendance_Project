package com.team5.myapp.reason.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude= {"reasonFileData", "files"})
public class Reason {
	private int reasonId;
	private String reasonContent;
	private Date reasonDate;
	private String userId;
	private String userName;
	private int reasonCategoryId;
	private int attendanceId;
	private int reasonStatus;
	private String reasonFileName;
	private long reasonFileSize;
	private String reasonFileContentType;
	private byte[] reasonFileData;
	private MultipartFile files;
	private int lectureId;
	private String reasonCategoryName;
	private Date reasonWriteDate;
}
