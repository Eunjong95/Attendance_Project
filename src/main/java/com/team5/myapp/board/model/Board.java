package com.team5.myapp.board.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude={"file", "boardFileData"})
public class Board {
	private int boardId;
	private int boardCategoryId;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int readCount;
	private List<Comments> commentList;
	
	private int page;
	private MultipartFile file;
	
	private int boardFileId;

	private String boardFileName;
	private long boardFileSize;
	private String boardFileContentType;
	private byte[] boardFileData;
	
}
