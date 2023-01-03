package com.team5.myapp.board.model;

public class BoardFile {
	private int bFileId;
	private int boardId;
	private String bFileName;
	private long bFileSize;
	private String bFileContentType;
	private byte[] bFileData;
	
	public int getbFileId() {
		return bFileId;
	}
	public void setbFileId(int bFileId) {
		this.bFileId = bFileId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
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
	
	@Override
	public String toString() {
		return "BoardFile [bFileId=" + bFileId + ", boardId=" + boardId + ", bFileName=" + bFileName + ", bFileSize="
				+ bFileSize + ", bFileContentType=" + bFileContentType + "]";
	}
	
}
