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
	IMemberRepository memberRepository;
	
	@Override
	public Member selectMember(String userId) {
		return memberRepository.selectMember(userId);
	}

	@Override
	public String getPassword(String userId) {
		return memberRepository.getPassword(userId);
	}

	@Override
	public int selectMemberRole(String userId) {
		return memberRepository.selectMemberRole(userId);
	}

	@Override
	public List<Member> selectMemberList(int page) {
		int start =(page-1)*5 +1;
		return memberRepository.selectMemberList(start,start+4);
	}

	@Override
	public int selectMemberByLecturePage(int lectureId) {
		return memberRepository.selectMemberCountByLectureId(lectureId);
	}

	@Override
	public List<Member> selectAttendanceListByLecture(int lectureId, Pager pager) {
		int start = pager.getStartRowNo() - 1;
		int end = pager.getRowsPerPage();
		return memberRepository.selectMemberAttendanceByLectureId(lectureId, start, end);
	}
	
	@Override
	public int selectMemberCount() {
		return memberRepository.selectMemberCount();
	}
	@Override
	public List<Member> selectMemberListByStatus(int attendanceStatus, int page) {

		return memberRepository.selectMemberListByStatus(attendanceStatus, (page-1)*5+1, (page-1)*5+5);
	}
	
	@Override
	public List<Member> selectMemberListByLectureId(int lectureId,int page) {
		int start=(page-1)*5+1;
		return memberRepository.selectMemberListByLectureId(lectureId,start,start+4);
	}
}
