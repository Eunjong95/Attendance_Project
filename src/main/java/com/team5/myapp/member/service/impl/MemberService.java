package com.team5.myapp.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.member.dao.IMemberRepository;
import com.team5.myapp.member.model.Member;
import com.team5.myapp.member.service.IMemberService;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberRepository memberDao;
	
	@Override
	public Member selectMember(String userId) {
		return memberDao.selectMember(userId);
	}

	@Override
	public String getPassword(String userId) {
		return memberDao.getPassword(userId);
	}

	@Override
	public int selectMemberRole(String userId) {
		return memberDao.selectMemberRole(userId);
	}

}
