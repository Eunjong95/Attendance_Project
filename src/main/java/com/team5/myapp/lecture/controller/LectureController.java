package com.team5.myapp.lecture.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team5.myapp.lecture.model.Lecture;
import com.team5.myapp.lecture.service.ILectureService;

@Controller
public class LectureController {
	@Autowired
	ILectureService lectureService;
	
	@RequestMapping(value="/admin/lecture/list/{page}")
	public String getLectureList( @PathVariable int page , HttpSession session, Model model) {
		session.setAttribute("page", page);
		
		List<Lecture> lectureList = lectureService.selectLectureList(page);
		model.addAttribute("lectureList",lectureList);
		
		//paging start
		int lCount = lectureService.selectTotalLecturePage();
		int totalPage = 0;
		if(lCount>0) {
			totalPage = (int)Math.ceil(lCount/5.0);
		}
		
		model.addAttribute("totalPageCount",totalPage);
		model.addAttribute("page",page);
		return "lecture/list";
	}
	@RequestMapping(value="/admin/lecture/list")
	public String getLectureList(HttpSession session, Model model) {
		
		return getLectureList(1,session,model);
	}
}
