package com.team5.myapp.reason.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.board.model.BoardFile;
import com.team5.myapp.reason.model.Reason;

public interface IReasonRepository {
	
	//사유서 승인 목록
	//int selectTotalReasonPage(@Param("reasonStatus")int reasonStatus);
	int selectTotalReasonPage(@Param("reasonStatus")int reasonStatus, @Param("lectureId")int lectureId);
	
	//List<Reason> selectReasonList(@Param("reasonStatus")int reasonStatus, @Param("start")int start, @Param("end")int end);
	List<Reason> selectReasonList(@Param("reasonStatus")int reasonStatus, @Param("lectureId")int lectureId, @Param("start")int start, @Param("end") int end);
	
	//사유서 작성 - attendance status : 휴가로 업데이트 
	void insertReason(Reason reason);
	
	//사유서를 신청할 날짜가 존재하는지
	//날짜가 존재하면 해당 날짜로 reason insert
	//날짜가 존재하지 않을 경우, 해당 날짜의 atteandacne 를 생성(insert) 후 reason insert.
	int selectAttendanceDate(Date reasonDate);
	
	//사유서 삭제 (승인되기전에만 가능), (관리자)승인 취소 요청 승인
	void deleteReason(int reasonId);
	
	//승인 취소 요청 (승인된 사유(1)에 대해서) - reason_status=1 -> reason_status=3, 관리자가 임의로 출근상태 변경할 때 
	void updateReasonStatus(@Param("reasonId") int reasonId, @Param("reasonStatus") int reasonStatus);
	
	//사유서 상세보기
	Reason selectReason(int reasonId);
	Reason getFile(int reasonId);
	
	//(관리자)강의, 사유 카테고리 별 요청 목록
	int selectTotalReasonPageByLecture(int lectureId);
	List<Reason> selectReasonListByLecture(@Param("lectureId") int lectureId, @Param("start") int start, @Param("end") int end);
	
}
