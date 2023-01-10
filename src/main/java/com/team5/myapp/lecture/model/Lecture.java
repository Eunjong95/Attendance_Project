package com.team5.myapp.lecture.model;

import java.util.List;

import com.team5.myapp.member.model.Member;

public class Lecture {
	private int lectureId;
	private String lectureName;
	private int memberNum;
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getLectureId() {
		return lectureId;
	}
	public void setLectureId(int lectureId) {
		this.lectureId = lectureId;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

}

