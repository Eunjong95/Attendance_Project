package com.team5.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.board.dao.IBoardCategoryRepository;
import com.team5.myapp.board.model.BoardCategory;
import com.team5.myapp.board.service.IBoardCategoryService;

@Service
public class BoardCategoryService implements IBoardCategoryService {
	
	@Autowired
	IBoardCategoryRepository boardCategoryRepository;
	
	@Override
	public List<BoardCategory> selectAllCategory() {
		
		return boardCategoryRepository.selectAllCategory();
	}

	@Override
	public void insertNewCategory(BoardCategory boardCategory) {
		boardCategory.setCategoryId(boardCategoryRepository.selectMaxCategoryId());
		boardCategoryRepository.insertNewCategory(boardCategory);
	}
	
}
