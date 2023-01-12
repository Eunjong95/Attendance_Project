package com.team5.myapp.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.Pager;
import com.team5.myapp.member.dao.IMemberRepository;
import com.team5.myapp.member.model.Member;
import com.team5.myapp.member.service.IMemberService;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberRepository memberDao;
	
	@Override
	public Member selectMember(String userId) {
		return memberDao.selectMember(userId);
	}

	@Override
	public String getPassword(String userId) {
		return memberDao.getPassword(userId);
	}

	@Override
	public int selectMemberRole(String userId) {
		return memberDao.selectMemberRole(userId);
	}

	@Override
	public List<Member> selectMemberList(int page) {
		int start =(page-1)*5 +1;
		return memberDao.selectMemberList(start,start+4);
	}

	@Override
	public int selectMemberByLecturePage(int lectureId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> selectAttendanceListByLecture(int lectureId, Pager pager) {
		int start = pager.getStartRowNo() - 1;
		int end = pager.getRowsPerPage();
		return memberDao.selectMemberListByLectureId(lectureId, start, end);
	}
	
	@Override
	public int selectMemberCount() {
		return memberDao.selectMemberCountByStatus();
	}
	@Override
	public int selectMemberCount(int attendanceStatus) {
		return memberDao.selectMemberCountByStatus(attendanceStatus);
	}
	@Override
	public List<Member> selectMemberListByLectureId(int lectureId,int page) {
		int start=(page-1)*5+1;
		return memberDao.selectMemberListByLectureId(lectureId,start,start+4);
	}
}
