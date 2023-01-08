package com.team5.myapp.lecture.service;

import java.util.List;

import com.team5.myapp.lecture.model.Lecture;

public interface ILectureService {
	int selectTotalLecturePage();
	List<Lecture> selectLectureList(int page);
}