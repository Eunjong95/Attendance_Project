package com.team5.myapp.board.model;

import java.sql.Date;

public class Comments {
	private int commentId;
	private Date commentDate;
	private String commentContent;
	private int boardId;
	private String userId;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Comments [commentId=" + commentId + ", commentDate=" + commentDate + ", commentContent="
				+ commentContent + ", boardId=" + boardId + ", userId=" + userId + "]";
	}
	
}
