package com.team5.myapp.reason.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.reason.model.Reason;

public interface IReasonService {
	//관리자 사유서 신청 목록
	int selectTotalReasonPage(int reasonStatus, int lectureId);
	List<Reason> selectReasonList(int reasonStatus, int lectureId, int page);

	// 내 사유서 신청 목록
	int selectTotalReasonPageByUserId(String userId);
	List<Reason> selectReasonListByUserId(String userId, int page);

	// 사유서 작성 - attendance status : 휴가로 업데이트
	void insertReason(Reason reason);

	int selectAttendanceDate(Date reasonDate);
	
	//사유서 삭제 (승인되기전에만 가능), (관리자)승인 취소 요청 승인
	void deleteReason(int reasonId);
	
	//승인 취소 요청 (승인된 사유(1)에 대해서) - reason_status=1 -> reason_status=3, 관리자가 임의로 출근상태 변경할 때 
	void updateReasonStatus(int reasonId, int reasonStatus);
	
	//사유서 상세보기
	Reason selectReason(int reasonId);
	Reason getFile(int reasonId);
	
	//(관리자)강의, 사유 카테고리 별 요청 목록
	int selectTotalReasonPageByLecture(int lectureId);
	List<Reason> selectReasonListByLecture(int lectureId, int page);
}
