package com.team5.myapp;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.service.IBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session, Model model) {
		session.setAttribute("page", 1);
		model.addAttribute("boardCategoryId",1);
		List<Board> boardList = boardService.selectBoardListByCategory(1, 1);
		model.addAttribute("boardList",boardList);
		
		//paging start
		int bbsCount = boardService.selectTotalBoardPageByCategoryId(1);
		int totalPage = 0;
		if(bbsCount>0) {
			totalPage = (int)Math.ceil(bbsCount/5.0);
		}
		
		model.addAttribute("totalPageCount",totalPage);
		model.addAttribute("page",1);
		
		return "home";
	}
	
}
