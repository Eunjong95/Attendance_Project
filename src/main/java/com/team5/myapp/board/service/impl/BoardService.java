package com.team5.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.board.dao.IBoardRepository;
import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.board.model.Comments;
import com.team5.myapp.board.service.IBoardService;
@Service
public class BoardService implements IBoardService {
	@Autowired
	IBoardRepository boardRepository;
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
		boardRepository.updateBoard(board);
	}

	@Override
	public void updateBoard(Board board, BoardFile file) {
		boardRepository.updateBoard(board);
		if(file!=null&&file.getbFileName()!=null&&!file.getbFileName().equals("")) {
			if(file.getbFileId()>0) {
				boardRepository.updateFileData(file);
			}else {
				
				boardRepository.insertFileData(file);
			}
		}
	}

	@Override
	public void deleteBoard(int boardId) {
		boardRepository.deleteBoard(boardId);
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
		boardRepository.updateComment(comment);
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
	public int selectTotalCommentsPageByCommentId(int commentId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Comments> selectCommentsListByCommentId(int commentId, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> searchListByContentKeyword(String keyword, int page) {
		// TODO Auto-generated method stub
		return null;
	}

}
