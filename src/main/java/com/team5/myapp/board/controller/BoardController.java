package com.team5.myapp.board.controller;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.board.service.IBoardService;

@Controller
public class BoardController {

	static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	IBoardService boardService;
	@RequestMapping(value="/board/update/{boardId}",method=RequestMethod.GET)
	public String updateBoard(@PathVariable int boardId, Model model) {
		Board board = boardService.selectBoard(boardId);
		/*Board board=new Board();
		board.setBoardId(boardId);
		board.setBoardTitle("게시판제목2");
		board.setBoardContent("게시판내용2");
		board.setBoardCategoryId(2);
		board.setUserId("user1");
		*/
		//System.out.println(board);
		model.addAttribute("board",board);
		return "board/update";
	}
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	public String updateBoard(Board board, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
		
		try {
			board.setBoardTitle(Jsoup.clean(board.getBoardTitle(), Whitelist.basic()));
			board.setBoardContent(Jsoup.clean(board.getBoardContent(), Whitelist.basic()));
			MultipartFile mfile= board.getFile();
			if(mfile!=null&& !mfile.isEmpty()) {
				BoardFile file=new BoardFile();
				file.setbFileName(mfile.getOriginalFilename());
				file.setbFileSize(mfile.getSize());
				file.setbFileContentType(mfile.getContentType());
				file.setbFileData(mfile.getBytes());
				file.setBoardId(board.getBoardId());
				boardService.updateBoard(board, file);
			}else {
				boardService.updateBoard(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/view/"+board.getBoardId();
	}
	/*RequestMapping(value="/board/delete/{boardId}",method=RequestMethod.GET)
	public String deleteBoard(@PathVariable int boardId, Model model) {
		return "board/delete";
	}*/
	@RequestMapping(value="/board/delete",method=RequestMethod.POST)
	public String deleteBoard(Board board, BindingResult result,HttpSession session, RedirectAttributes redirectAttrs) {
		try {
			//board.setBoardId(4);//테스트용 
			boardService.deleteBoard(board.getBoardId());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/cat/"+board.getBoardCategoryId()+"/"+(Integer)session.getAttribute("page");
	}
	
}
