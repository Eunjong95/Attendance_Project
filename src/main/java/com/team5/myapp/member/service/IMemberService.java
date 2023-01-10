package com.team5.myapp.member.service;

import java.util.List;

import com.team5.myapp.member.model.Member;

public interface IMemberService {
	Member selectMember(String userId);
	String getPassword(String userId);
	int selectMemberRole(String userId);
	List<Member> selectMemberList(int page);
}
