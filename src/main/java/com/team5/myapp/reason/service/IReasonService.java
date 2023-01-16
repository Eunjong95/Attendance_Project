package com.team5.myapp.reason.service;

import java.util.List;

import com.team5.myapp.Pager;
import com.team5.myapp.reason.model.Reason;

public interface IReasonService {
	//관리자 사유서 신청 목록
	int selectTotalReasonPage(int reasonStatus, int lectureId);
	List<Reason> selectReasonList(int reasonStatus, int lectureId, Pager pager);

	// 내 사유서 신청 목록
	int selectTotalReasonPageByUserId(String userId);
	List<Reason> selectReasonListByUserId(String userId, int page);

	// 사유서 작성 
	void insertReason(Reason reason);
	List<Integer> selectAttendanceStatus(Reason reason);

	//사유서 삭제 (승인되기전에만 가능), (관리자)승인 취소 요청 승인
	void deleteReason(int reasonId);
	
	//사유서  요청  처리(관리자)
	int selectAttendanceDate(Reason reason);
	
	void updateReasonStatus(int reasonId, int reasonStatus);
	void updateAttendanceStatus(int attendanceId, Reason reason);
	void insertAttendanceStatus(Reason reason);
	void deleteAttendanceStatus(int attendanceId, Reason reason);
	
	//사유서 상세보기
	Reason selectReason(int reasonId);
	Reason getFile(int reasonId);
	
	// 새로운 요청 목록(관리자)
	int selectNewReasonCount();
}
