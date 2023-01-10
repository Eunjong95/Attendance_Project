package com.team5.myapp;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.myapp.board.model.Board;
import com.team5.myapp.board.service.IBoardService;
import com.team5.myapp.lecture.model.Lecture;
import com.team5.myapp.lecture.service.ILectureService;
import com.team5.myapp.member.model.Member;
import com.team5.myapp.member.service.IMemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	IBoardService boardService;
	@Autowired
	ILectureService lectureService;
	@Autowired
	IMemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session, Model model) {
		session.setAttribute("page", 1);
		model.addAttribute("boardCategoryId",1);
		List<Board> boardList = boardService.selectBoardListByCategory(1, 1);
		model.addAttribute("boardList",boardList);
		
		//paging start
		int bbsCount = boardService.selectTotalBoardPageByCategoryId(1);
		int totalPage = 0;
		if(bbsCount>0) {
			totalPage = (int)Math.ceil(bbsCount/5.0);
		}
		
		model.addAttribute("totalPageCount",totalPage);
		model.addAttribute("page",1);
		
		return "home";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Locale locale, HttpSession session, Model model) {

		//System.out.println(session.getAttribute("role"));
		if(session.getAttribute("role")==null||session.getAttribute("role").equals(0)) {
			return "redirect:/";
		}

		session.setAttribute("page", 1);
		List<Lecture> lectureList = lectureService.selectLectureList(1);
		model.addAttribute("lectureList",lectureList);
		logger.info("homeController : ", lectureList);

		List<Member> memberList=memberService.selectMemberList(1);
		model.addAttribute("memberList", memberList);

		//paging start
		/*int lCount = lectureService.selectTotalLecturePage()
		int totalPage = 0;
		if(lCount>0) {
			totalPage = (int)Math.ceil(lCount/5.0);
		}
		
		model.addAttribute("lecturetotalPage",totalPage);*/
		return "admin/home";
	}
	@RequestMapping(value="/admin/memberList/{page}" , method=RequestMethod.GET)
	public @ResponseBody List<Member> getMemberList(@PathVariable int page){
		
		List<Member> memberList=memberService.selectMemberList(page);
		
		return memberList;
	}
	
}
