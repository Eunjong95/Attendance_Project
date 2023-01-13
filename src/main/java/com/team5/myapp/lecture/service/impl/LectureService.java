package com.team5.myapp.lecture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.lecture.dao.ILectureRepository;
import com.team5.myapp.lecture.model.Lecture;
import com.team5.myapp.lecture.service.ILectureService;
import com.team5.myapp.member.dao.IMemberRepository;
@Service
public class LectureService implements ILectureService {
	@Autowired
	ILectureRepository lectureRepository;
	@Autowired
	IMemberRepository memberRepository;

	@Override
	public int selectTotalLecturePage() {
		return lectureRepository.selectTotalLecturePage();
	}

	@Override
	public List<Lecture> selectLectureList(int page) {
		int start =(page-1)*5 +1;
		List<Lecture> lectures=lectureRepository.selectLectureList(start, start+4);
		for(Lecture lecture : lectures) {
			lecture.setMemberNum(memberRepository.selectMemberCountByLectureId(lecture.getLectureId()));
			lecture.setAttendMemberNum(memberRepository.selectAttendMemberCountByLectureId(lecture.getLectureId()));
		}
		return lectures;
	}
	
	@Override
    public Lecture selectLecture(String userId) {
       return lectureRepository.selectLecture(userId);
    } 
}

