package com.team5.myapp.attendance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.myapp.attendance.dao.IAttendanceRepository;
import com.team5.myapp.attendance.model.Attendance;
import com.team5.myapp.attendance.service.IAttendanceService;
import com.team5.myapp.member.model.Member;

@Service
public class AttendanceService implements IAttendanceService {
	@Autowired
	IAttendanceRepository attendanceRepository;
	
	//출근
	@Override
	public void insertWorktime(String userId) {
		attendanceRepository.insertWorktime(userId);
	}
	//퇴근
	@Override
	public void updateWorktime(String userId){
		attendanceRepository.updateWorktime(userId);
	}
	
	//출결 가져오기
	@Transactional
	public Attendance selectAttendance(String userId) {
		return attendanceRepository.selectAttendance(userId);
	}
	
	//status 현황 변경
	@Transactional
	public void updateAttendanceStatus(int attendanceStatus, String userId) {
		Attendance attendance = new Attendance();
		attendance.setStatus(attendanceStatus);
		attendance.setUserId(userId);
		attendanceRepository.updateAttendanceStatus(attendance);
		
	}
	
	
	@Override
	public int selectTotalAttendancePage(String userId) {
		return attendanceRepository.selectTotalAttendancePage(userId);
	}
	
	//출결현황
	@Override
	public List<Attendance> selectAttendanceList(String userId, int page) {
		int start = (page-1)*5+1;
		return attendanceRepository.selectAttendanceList(userId, start, start+4);
	}
	
	//지각
	@Override
	public int selectLateCount(String userId) {
		return attendanceRepository.selectLateCount(userId);
	}
	//결근
	@Override
	public int selectAbsenceCount(String usrId) {
		return attendanceRepository.selectAbsenceCount(usrId);
	}
	//출근
	@Override
	public int selectAttendanceCount(String userId) {
		return attendanceRepository.selectAttendanceCount(userId);
	}

	@Override
	public int seletTotalMemberPageByLecture(int lectureId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> selectMemberListByLecture(int lectureId, int page) {
		// TODO Auto-generated method stub
		return null;
	}
}
