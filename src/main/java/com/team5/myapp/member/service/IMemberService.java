package com.team5.myapp.member.service;

import java.util.List;

import com.team5.myapp.member.model.Member;

public interface IMemberService {
	Member selectMember(String userid);
	String getPassword(String userid);
}
