package com.team5.myapp.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.member.model.Member;

public interface IMemberRepository {
	Member selectMember(String userId);
	String getPassword(String userId);
	int selectMemberRole(String userId);
	
	//강의별 학생 수
	int selectMemberCountByLectureId(@Param("lectureId") int lectureId);
	
	int selectMemberCount(@Param("lectureId") int lectureId);
	
	int selectAttendMemberCountByLectureId(int lectureId);
	List<Member> selectMemberList(@Param("start") int start,@Param("end") int end);
	int selectMemberCount();
	List<Member> selectMemberListByStatus(@Param("attendanceStatus") int attendanceStatus, @Param("start") int start,@Param("end") int end);
	
	
	List<Member> selectMemberListByLectureId(@Param("lectureId")int lectureId, @Param("start") int start, @Param("end") int end);
	List<Member> selectMemberAttendanceByLectureId(@Param("lectureId")int lectureId, @Param("start") int start, @Param("end") int end);

}
