package com.team5.myapp.reason.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude= {"reasonFileData", "files"})
public class Reason {
	private int reasonId;
	private String reasonContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
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
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date reasonWriteDate;
}
