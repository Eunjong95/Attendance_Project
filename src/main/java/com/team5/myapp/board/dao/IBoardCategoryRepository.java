package com.team5.myapp.board.dao;

import java.util.List;

import com.team5.myapp.board.model.BoardCategory;

public interface IBoardCategoryRepository {

	int selectMaxCategoryId();
	List<BoardCategory> selectAllCategory();
	void insertNewCategory(BoardCategory boardCategory);
}
