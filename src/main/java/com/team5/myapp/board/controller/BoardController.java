package com.team5.myapp.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team5.myapp.board.model.BoardCategory;
import com.team5.myapp.board.service.IBoardCategoryService;
import com.team5.myapp.board.service.IBoardService;

public class BoardController {

	static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	IBoardService boardService;
	
	@Autowired
	IBoardCategoryService categoryService;
	
	//게시글 작성
	@RequestMapping(value="/board/write/{categoryId}",method=RequestMethod.GET)
	public String writeArticle(@PathVariable int categoryId, Model model) {
		List<BoardCategory> categoryList = categoryService.selectAllCategory();
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("categoryId",categoryId);
		return "board/write";
	}
}
