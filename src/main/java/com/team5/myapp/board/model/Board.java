package com.team5.myapp.board.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	private int bFileId;

	private String bFileName;
	private long bFileSize;
	private String bFileContentType;
	private byte[] bFileData;
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public int getBoardCategoryId() {
		return boardCategoryId;
	}
	public void setBoardCategoryId(int boardCategoryId) {
		this.boardCategoryId = boardCategoryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getbFileId() {
		return bFileId;
	}
	public void setbFileId(int bFileId) {
		this.bFileId = bFileId;
	}
	public String getbFileName() {
		return bFileName;
	}
	public void setbFileName(String bFileName) {
		this.bFileName = bFileName;
	}
	public long getbFileSize() {
		return bFileSize;
	}
	public void setbFileSize(long bFileSize) {
		this.bFileSize = bFileSize;
	}
	public String getbFileContentType() {
		return bFileContentType;
	}
	public void setbFileContentType(String bFileContentType) {
		this.bFileContentType = bFileContentType;
	}
	public byte[] getbFileData() {
		return bFileData;
	}
	public void setbFileData(byte[] bFileData) {
		this.bFileData = bFileData;
	}
	
	public List<Comments> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comments> commentList) {
		this.commentList = commentList;
	}
	
	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", boardCategoryId=" + boardCategoryId + ", userId=" + userId
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardDate=" + boardDate
				+ ", readCount=" + readCount + ", page=" + page + ", bFileId=" + bFileId + ", bFileName=" + bFileName
				+ ", bFileSize=" + bFileSize + ", bFileContentType=" + bFileContentType + "]";
	}
	
}
