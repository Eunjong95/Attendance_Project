package com.team5.myapp.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team5.myapp.member.model.Member;
import com.team5.myapp.member.service.IMemberService;


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
	public String login(String userid , String password, HttpSession session, Model model) {
		Member member = memberService.selectMember(userid);
		if(member != null) {
			String dbPassword = member.getPassword();
			
			if(dbPassword == null) { //아이디가 없음
				System.out.println("아이디 없음.");
				//model.addAttribute("message", "NOT_VALID_USER");
			} else { // 아이디 있음
				if(dbPassword.equals(password)) { // 비밀번호 일치
					session.setAttribute("userid",  userid);
					session.setAttribute("name", member.getUserName());
					session.setAttribute("email", member.getEmail());
					return "member/login";
				} else { // 비밀번호 불일치
					System.out.println("비밀번호 불일치");
					//model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		} else {
			//model.addAttribute("message", "USER_NOT_FOUNT");
		}
		session.invalidate();
		return "member/login";
	}
	
	// 로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "home";
	}
		
}
