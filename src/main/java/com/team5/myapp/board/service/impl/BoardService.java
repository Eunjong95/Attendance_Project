package com.team5.myapp.board.service.impl;

import java.util.List;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.board.model.Comments;
import com.team5.myapp.board.service.IBoardService;

public class BoardService implements IBoardService {

	@Override
	public void insertBoard(Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoard(Board board, BoardFile file) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(Board board, BoardFile file) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(int boardId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectTotalBoardPageByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Board> selectBoardListByCategory(int categoryId, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectBoard(int boardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardFile getFile(int fileId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReadCount(int boardId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertComment(Comments comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComment(Comments comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(int commentId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectTotalBoardPageByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Board> searchListByContentKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
