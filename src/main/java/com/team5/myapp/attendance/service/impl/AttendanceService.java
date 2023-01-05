package com.team5.myapp.attendance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.attendance.dao.IAttendanceRepository;
import com.team5.myapp.attendance.model.Attendance;
import com.team5.myapp.attendance.service.IAttendanceService;
import com.team5.myapp.member.model.Member;

@Service
public class AttendanceService implements IAttendanceService {
	@Autowired
	IAttendanceRepository attendanceRepository;
	
	@Override
	public void insertWorktime(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateWorktime(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAttendanceStatus(int attendanceId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectTotalAttendancePage(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Attendance> selectAttendanceList(String userId, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectLateCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectAbsenceCount(String usrId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectAttendanceCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
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
