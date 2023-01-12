package com.team5.myapp.member.controller;

import java.util.List;

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

import com.team5.myapp.member.model.Member;
import com.team5.myapp.member.service.IMemberService;


@Controller
public class MemberController {
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	IMemberService memberService;
	
	// 로그인 
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(String userId , String password, HttpSession session, Model model) {
		Member member = memberService.selectMember(userId);
		int memberRole = memberService.selectMemberRole(userId);
		
		if(member != null) {
			String dbPassword = member.getPassword();
			System.out.println("password: " + dbPassword);
			if(dbPassword == null) { //아이디가 없음
				System.out.println("아이디 없음.");
			} else { // 아이디 있음
				if(dbPassword.equals(password) && memberRole==0) { // 비밀번호 일치, 일반 수강생
					session.setAttribute("userId",  userId);
					session.setAttribute("userName", member.getUserName());
					session.setAttribute("email", member.getEmail());
					session.setAttribute("role", member.getRole());
					System.out.println(userId + " " + member.getUserName());
					
					session.setAttribute("member", member);
					return "redirect:/";
				} else if(dbPassword.equals(password) && memberRole==1) { // 비밀번호 일치, 관리자
					session.setAttribute("userId",  userId);
					session.setAttribute("userName", member.getUserName());
					session.setAttribute("email", member.getEmail());
					session.setAttribute("role", member.getRole());
					System.out.println(userId + " " + member.getUserName());
					
					session.setAttribute("member", member);
					return "redirect:/admin";
				} else { // 비밀번호 불일치
					System.out.println("비밀번호 불일치");
				}
			}
		} else {
			//model.addAttribute("message", "USER_NOT_FOUNT");
		}
		session.invalidate();
		return "home";
	}
	
	// 로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/";
	}
	
	//강의 별 학생 목록
//	@RequestMapping(value="/admin/member/list/{lectureId}/{page}", method=RequestMethod.GET)
//	public String getMemberList(@PathVariable(value="lectureId", required = false) Integer lectureId, @PathVariable int page, HttpSession session, Model model) {
//		session.setAttribute("page", page);
//		session.setAttribute("lectureId", lectureId);
//		
//		//int memberCount = memberService.selectMemberByLecturePage(lectureId);
//		//Pager pager = new Pager(10, 5, memberCount, page);
//		
//		//List<Member> memberList = memberService.selectAttendanceListByLecture(lectureId, pager);
//		
//		//model.addAttribute("memberList", memberList);
//		model.addAttribute("page", page);
//		//model.addAttribute("pager", pager);
//		return "admin/member/memberList";
//	}
	
//	@RequestMapping(value="/admin/member/list/{lectureId}", method=RequestMethod.GET)
//	public String getMemberList(@PathVariable(value="lectureId", required = false) Integer lectureId, HttpSession session, Model model) {
//		if(lectureId == null) {
//			lectureId = 0;
//		}
//		
//		return getMemberList(lectureId, 1, session, model);
//	}
	
	@RequestMapping(value="/admin/lecture/list/members/{lectureId}/{page}", method=RequestMethod.GET)
	public @ResponseBody List<Member> getMemberListByLectureId(@PathVariable int lectureId, @PathVariable int page ) {
		List<Member> memberList=memberService.selectMemberListByLectureId(lectureId,page);
		//System.out.println(memberList);
		return memberList;
	}
	
	@RequestMapping(value="/admin/lecture/list/members/{lectureId}", method=RequestMethod.GET)
	public @ResponseBody List<Member> getMemberListByLectureId(@PathVariable int lectureId ) {
		
		return getMemberListByLectureId(lectureId,1);
	}
}
