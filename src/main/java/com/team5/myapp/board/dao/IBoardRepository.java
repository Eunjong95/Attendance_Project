package com.team5.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.board.model.Comments;

public interface IBoardRepository {
	//게시글 작성, 수정, 삭제
	void insertBoard(Board board);
	void insertFileData(BoardFile file);
	void updateBoard(Board board);
	void updateFileData(BoardFile file);
	void deleteFileData(int boardId);
	void deleteBoard(int boardId);
	
	//목록 조회
	int selectTotalBoardPageByCategoryId(int categoryId);
	List<Board> selectBoardListByCategory(@Param("categoryId") int categoryId, @Param("start") int start, @Param("end") int end);
	
	//게시글 상세보기
	Board selectBoard(int boardId);
	BoardFile getFile(int fileId);
	
	//조회수 증가
	void updateReadCount(int boardId);

	//댓글 작성, 수정, 삭제
	void insertComment(Comments comment);
	void updateComment(Comments comment);
	void deleteComment(int commentId);
	
	//검색
	int selectTotalBoardPageByKeyword(String keyword);
	List<Board> searchListByContentKeyword(@Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);
}
