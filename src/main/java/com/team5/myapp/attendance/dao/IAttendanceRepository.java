package com.team5.myapp.attendance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.attendance.model.Attendance;
import com.team5.myapp.member.model.Member;

public interface IAttendanceRepository {

	//출석 insert
	void insertWorktime(String userId);
	void updateWorktime(String userId);
	
	//금일 출결 가져오기
	Attendance selectAttendance(String userId);
	
	//출결 상태 update
	void updateAttendanceStatus(Attendance attendance);
	
	//출결 현황 목록
	int selectTotalAttendancePage(String userId);
	List<Attendance> selectAttendanceList(@Param("userId") String userId, @Param("start") int start, @Param("end") int end);

	//지각 횟수
	int selectLateCount(String userId);
	
	//결근 횟수
	int selectAbsenceCount(String userId);
	
	//출석 횟수
	int selectAttendanceCount(String userId);
	
	/* 관리자 */
	//강의 별 학생 목록
	int seletTotalMemberPageByLecture(int lectureId);
	List<Member> selectMemberListByLecture(@Param("lectureId") int lectureId, @Param("start") int start, @Param("end") int end);
	
}
