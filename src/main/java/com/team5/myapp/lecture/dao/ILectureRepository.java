package com.team5.myapp.lecture.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.myapp.lecture.model.Lecture;

public interface ILectureRepository {
	int selectTotalLecturePage();
	List<Lecture> selectLectureList(@Param("start") int start,@Param("end") int end);


}