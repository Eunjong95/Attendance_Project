package com.team5.myapp.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Comments {
	private int commentId;
	private Date commentDate;
	private String commentContent;
	private int boardId;
	private String userId;
}
