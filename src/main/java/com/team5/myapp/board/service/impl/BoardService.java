package com.team5.myapp.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.myapp.board.dao.IBoardRepository;
import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.board.model.Comments;
import com.team5.myapp.board.service.IBoardService;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	IBoardRepository boardRepository;
	
	@Transactional
	public void insertBoard(Board board) {
		boardRepository.insertBoard(board);
	}

	@Transactional
	public void insertBoard(Board board, BoardFile file) {
		board.setBoardId(boardRepository.selectMaxArticleNo()+1);
		boardRepository.insertBoard(board);
        if(file != null && file.getbFileName() != null && !file.getbFileName().equals("")) {
        	file.setBoardId(board.getBoardId());
        	file.setbFileId(boardRepository.selectMaxFileId()+1);
        	boardRepository.insertFileData(file);
        }
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
	public int selectTotalBoardPageByCategoryId(int boardCategoryId) {
		// 카테고리에 있는 게시글 총 개수
		return boardRepository.selectTotalBoardPageByCategoryId(boardCategoryId);
	}

	@Override
	public List<Board> selectBoardListByCategory(int boardCategoryId, int page) {
		// 해당 카테고리 게시글 전체
		int start =(page-1)*5 +1;
		return boardRepository.selectBoardListByCategory(boardCategoryId, start, start+4);
	}

	@Transactional
	public Board selectBoard(int boardId) {
		boardRepository.updateReadCount(boardId);
		return boardRepository.selectBoard(boardId);
	}

	@Override
	public BoardFile getFile(int fileId) {
		return boardRepository.getFile(fileId);
	}

	@Override
	public void insertComment(Comments comment) {
		boardRepository.insertComment(comment);
	}

	@Override
	public void updateComment(Comments comment) {
		boardRepository.updateComment(comment);
	}

	@Override
	public void deleteComment(int commentId) {
		boardRepository.deleteComment(commentId);
	}

	@Override
	public int selectTotalBoardPageByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalCommentsPageByCommentId(int boardId) {
		return boardRepository.selectTotalCommentsPageByCommentId(boardId);
	}

	@Override
	public List<Comments> selectCommentsListByCommentId(int boardId, int cPage) {
		int start = (cPage - 1) * 10 + 1;
		return boardRepository.selectCommentsListByCommentId(boardId, start, start + 9);
	}

	@Override
	public List<Board> searchListByContentKeyword(String keyword, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comments selectComment(int commentId) {
		
		return boardRepository.selectComment(commentId);
	}
}
