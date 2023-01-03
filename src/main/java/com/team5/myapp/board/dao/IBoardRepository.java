package com.team5.myapp.board.dao;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;

public interface IBoardRepository {
	void insertArticle(Board board);
	void insertFileData(BoardFile file);
	BoardFile getFile(int fileId);
}
