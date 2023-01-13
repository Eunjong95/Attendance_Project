package com.team5.myapp.member.service;

import java.util.List;

import com.team5.myapp.Pager;
import com.team5.myapp.member.model.Member;

public interface IMemberService {
	Member selectMember(String userId);
	String getPassword(String userId);
	int selectMemberRole(String userId);
	List<Member> selectMemberList(int page);
	int selectMemberCount();
	
	List<Member> selectMemberListByStatus(int attendanceStatus,int page);
	
	//강의별 학생 출석 정보
	int selectMemberByLecturePage(int lectureId);
	List<Member> selectMemberListByLectureId(int lectureId, int page);
	
	//학생 출결 목록
	List<Member> selectAttendanceListByLecture(int lectureId, Pager pager);
}
