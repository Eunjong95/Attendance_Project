package com.team5.myapp.reason.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.reason.model.Reason;

public interface IReasonRepository {
	
	//관리자 사유서 목록
	int selectTotalReasonPage(@Param("reasonStatus")int reasonStatus, @Param("lectureId")int lectureId);
	List<Reason> selectReasonList(@Param("reasonStatus")int reasonStatus, @Param("lectureId")int lectureId, @Param("start")int start, @Param("end") int end);
	
	//내 사유서 신청 목록
	int selectTotalReasonPageByUserId(@Param("userId")String userId);
	List<Reason> selectReasonListByUserId(@Param("userId")String userId, @Param("start") int start, @Param("end") int end);

	//사유서 작성
	void insertReason(Reason reason);
	void insertReasonWithFile(Reason reason);
	List<Integer> selectAttendanceStatus(Reason reason);
	
	//사유서 삭제 (승인되기전에만 가능), (관리자)승인 취소 요청 승인
	void deleteReason(int reasonId);
	
	//사유서 승인 처리
	int selectAttendanceDate(Reason reason);
	void updateAttendanceStatus(int attendanceId);
	void insertAttendanceStatus(Reason reason);
	void deleteAttendanceStatus(int attendanceId);
	
	void updateReasonStatus(@Param("reasonId") int reasonId, @Param("reasonStatus") int reasonStatus);
	
	//사유서 상세보기
	Reason selectReason(int reasonId);
	Reason getFile(int reasonId);
	
	//(관리자)강의, 사유 카테고리 별 요청 목록
	int selectTotalReasonPageByLecture(int lectureId);
	List<Reason> selectReasonListByLecture(@Param("lectureId") int lectureId, @Param("start") int start, @Param("end") int end);
	
	//사유 요청 알림
	int selectReasonCount();
}
