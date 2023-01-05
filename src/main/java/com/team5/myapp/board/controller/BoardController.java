package com.team5.myapp.board.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.team5.myapp.board.model.Comments;
import com.team5.myapp.board.service.IBoardService;

@Controller
public class BoardController {

	static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int fileId) {
		BoardFile file = boardService.getFile(fileId);
		logger.info("getFile " + file.toString());
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getbFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getbFileSize());
		headers.setContentDispositionFormData("attachment", file.getbFileName(), Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(file.getbFileData(), headers, HttpStatus.OK);
	}
	
	//게시글 작성
	@RequestMapping(value="/board/write/{boardCategoryId}", method=RequestMethod.GET)
	public String writeBoard(@PathVariable int boardCategoryId, Model model) {
		model.addAttribute("boardCategoryId", boardCategoryId);
		return "board/write";
	}
	
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String writeBoard(Board board, BindingResult result, RedirectAttributes redirectAttrs) {
		System.out.println("writeBoard");
		logger.info("/board/write : " + board.toString());
		try{
			board.setBoardContent(board.getBoardContent().replace("\r\n", "<br>"));
			board.setBoardTitle(Jsoup.clean(board.getBoardTitle(), Whitelist.basic()));
			board.setBoardContent(Jsoup.clean(board.getBoardContent(), Whitelist.basic()));
			MultipartFile mfile = board.getFile();
			if(mfile!=null && !mfile.isEmpty()) {
				logger.info("/board/write : " + mfile.getOriginalFilename());
				BoardFile file = new BoardFile();
				file.setbFileName(mfile.getOriginalFilename());
				file.setbFileSize(mfile.getSize());
				file.setbFileContentType(mfile.getContentType());
				file.setbFileData(mfile.getBytes());
				logger.info("/board/write : " + file.toString());
				boardService.insertBoard(board, file);
			} else {
				boardService.insertBoard(board);
			}
		} catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		//return "redirect:/board/cat/" + board.getBoardCategoryId();
		return "home";
	}
	
	//게시글 수정
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
	
	//게시글 삭제
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
	
	//게시글 목록
	@RequestMapping("/board/cat/{boardCategoryId}/{page}")
	public String getBoardList(@PathVariable int boardCategoryId, @PathVariable int page, HttpSession session, Model model ) {
		session.setAttribute("page", page);
		model.addAttribute("boardCategoryId",boardCategoryId);
		List<Board> boardList = boardService.selectBoardListByCategory(boardCategoryId, page);
		model.addAttribute("boardList",boardList);
		
		//paging start
		int bbsCount = boardService.selectTotalBoardPageByCategoryId(boardCategoryId);
		int totalPage = 0;
		if(bbsCount>0) {
			totalPage = (int)Math.ceil(bbsCount/5.0);
		}
		
		model.addAttribute("totalPageCount",totalPage);
		model.addAttribute("page",page);
		
		return "board/list";
	}
	
	@RequestMapping("/board/cat/{boardCategoryId}")
	public String getBoardList(@PathVariable int boardCategoryId, HttpSession session, Model model) {
		return getBoardList(boardCategoryId,1,session,model);
	}
	
	// 게시글 상세조회
	@RequestMapping("/board/view/{boardId}/{page}/{cPage}")
	public String getBoardDetail(@PathVariable int boardId, @PathVariable int page, @PathVariable int cPage, HttpSession session, Model model) {
		Board board = boardService.selectBoard(boardId);
		board.setCommentList(boardService.selectCommentsListByCommentId(boardId, cPage));
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		model.addAttribute("boardCategoryId", board.getBoardCategoryId());
		
		// 댓글 페이징 처리
		int commentCount = boardService.selectTotalCommentsPageByCommentId(boardId);
		int totalCommentPage = 0;
		if (commentCount > 0) {
			totalCommentPage = (int) Math.ceil(commentCount / 10.0);
		}

		model.addAttribute("totalCommentPage", totalCommentPage);
		model.addAttribute("cPage", cPage);
		
		logger.info("getBoardDetail", board.toString());
		return "board/view";
	}

	@RequestMapping("/board/view/{boardId}")
	public String getBoardDetail(@PathVariable int boardId, HttpSession session, Model model) {
		return getBoardDetail(boardId, 1, 1, session, model);
	}
	
	//댓글 작성
	@RequestMapping(value="/board/comment/write", method=RequestMethod.POST)
	public String commentWrite(Comments comment, BindingResult result, RedirectAttributes redirectAttrs, HttpSession session) {
//		comment.setCommentContent(comment.getCommentContent());
		//comment.setUserId((String)session.getAttribute("userId"));

		System.out.println("comment: " + comment.toString());
		
		boardService.insertComment(comment);
		return "redirect:/board/view/"+comment.getBoardId();
	}
	
	//댓글 수정
	@RequestMapping(value="/board/comment/update" ,method=RequestMethod.POST)
	public String updateComment(Comments comment,Model model, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
		try {
			boardService.updateComment(comment);
			model.addAttribute("comment",comment);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "board/comment/update";
	}
	
	//댓글 삭제
	@RequestMapping(value="/board/comment/delete",method=RequestMethod.POST)
	public String deleteComments(Comments comment, BindingResult result,HttpSession session, RedirectAttributes redirectAttrs) {
		try {
			//board.setBoardId(4);//테스트용 
			boardService.deleteComment(comment.getCommentId());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/view/"+comment.getBoardId()+"/"+(Integer)session.getAttribute("page");
	}
}
