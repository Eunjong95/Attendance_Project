package com.team5.myapp.member.dao;

import com.team5.myapp.member.model.Member;

public interface IMemberRepository {
	Member selectMember(String userid);
	String getPassword(String userid);
}
