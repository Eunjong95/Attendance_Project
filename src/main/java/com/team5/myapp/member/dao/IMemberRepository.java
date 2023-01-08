package com.team5.myapp.member.dao;

import com.team5.myapp.member.model.Member;

public interface IMemberRepository {
	Member selectMember(String userId);
	String getPassword(String userId);
	int selectMemberRole(String userId);
	int selectMemberCount(int lectureId);
}
