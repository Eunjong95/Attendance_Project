package com.team5.myapp.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.member.model.Member;

public interface IMemberRepository {
	Member selectMember(String userId);
	String getPassword(String userId);
	int selectMemberRole(String userId);
	int selectMemberCountByLecutreId(int lectureId);
	int selectAttendMemberCountByLectureId(int lectureId);
	List<Member> selectMemberList(@Param("start") int start,@Param("end") int end);
	int selectMemberCountByStatus();
	int selectMemberCountByStatus(@Param("attendanceStatus") int attendanceStatus);
	List<Member> selectMemberListByLectureId(@Param("lectureId")int lectureId, @Param("start") int start, @Param("end") int end);
	
}
