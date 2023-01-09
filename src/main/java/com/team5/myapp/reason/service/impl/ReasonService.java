package com.team5.myapp.reason.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.myapp.reason.dao.IReasonRepository;
import com.team5.myapp.reason.model.Reason;
import com.team5.myapp.reason.service.IReasonService;

@Service
public class ReasonService implements IReasonService {
	@Autowired
	IReasonRepository reasonRepository;

	@Override
	public int selectTotalReasonPage(int reasonStatus, int lectureId) {
		return reasonRepository.selectTotalReasonPage(reasonStatus, lectureId);
	}

	@Override
	public List<Reason> selectReasonList(int reasonStatus, int lectureId, int page) {
		int start =(page-1)*5 + 1;
		return reasonRepository.selectReasonList(reasonStatus, lectureId, start, start+4);
	}

	@Override
	public void insertReason(Reason reason) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectAttendanceDate(Date reasonDate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteReason(int reasonId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReasonStatus(int resaonId, int reasonStatus) {
		reasonRepository.updateReasonStatus(resaonId, reasonStatus);
	}

	@Override
	public Reason getFile(int reasonId) {
		return reasonRepository.getFile(reasonId);
	}
	
	@Override
	public Reason selectReason(int reasonId) {
		return reasonRepository.selectReason(reasonId);
	}

	@Override
	public int selectTotalReasonPageByLecture(int lectureId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reason> selectReasonListByLecture(int lectureId, int page) {
		// TODO Auto-generated method stub
		return null;
	}

}
