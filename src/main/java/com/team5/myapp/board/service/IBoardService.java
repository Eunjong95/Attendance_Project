package com.team5.myapp.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.board.model.Comments;

public interface IBoardService {
	
	//게시글 작성, 수정, 삭제
	void insertBoard(Board board); // 파일 없이 글쓸때
	void insertBoard(Board board, BoardFile file); //파일 첨부 있을때
	void updateBoard(Board board);
	void updateBoard(Board board, BoardFile file);
	void deleteBoard(int boardId);
	
	//목록 조회
	int selectTotalBoardPageByCategoryId(int categoryId);
	List<Board> selectBoardListByCategory(int categoryId, int page);
	
	//게시글 상세보기
	Board selectBoard(int boardId);
	BoardFile getFile(int fileId);
	
	//조회수 증가
	//void updateReadCount(int boardId);

	//댓글 작성, 수정, 삭제
	void insertComment(Comments comment);
	void updateComment(Comments comment);
	void deleteComment(int commentId);
	
	//댓글 목록 조회
	int selectTotalCommentsPageByCommentId(int boardId);
	List<Comments> selectCommentsListByCommentId(int boardId, int page);
   	
	//검색
	int selectTotalBoardPageByKeyword(String keyword);
	List<Board> searchListByContentKeyword(String keyword, int page);
	Comments selectComment(int commentId);
	
	//공지사항
	List<Board> selectBoardListByRole(int page);
	
}
