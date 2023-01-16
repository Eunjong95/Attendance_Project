package com.team5.myapp.board.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="boardFileData")
public class BoardFile {
	private int boardFileId;
	private int boardId;
	private String boardFileName;
	private long boardFileSize;
	private String boardFileContentType;
	private byte[] boardFileData;
}
