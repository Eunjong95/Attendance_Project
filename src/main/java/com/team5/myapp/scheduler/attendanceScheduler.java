package com.team5.myapp.scheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team5.myapp.attendance.model.Attendance;
import com.team5.myapp.attendance.service.IAttendanceService;

@EnableScheduling
@Component
public class attendanceScheduler {

	@Autowired
	IAttendanceService attendanceService;
	
	@Scheduled(cron="0 0 0 * * *")
	public void attendanceNullCheck() {
		//퇴근 체크 안한 모든 사람 -> 결근
		attendanceService.noAllCheckAttendance();
	}
	@Scheduled(cron="0 0 0 * * *")
	public void nullInsertAttendance() {
		//무단 결근
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String yesterday = format.format(date.getTime());
	
		List<Attendance> memberList = attendanceService.selectMember();
		for(int i=0;i<memberList.size();i++) {			
			String attendanceDate = format.format(memberList.get(i).getAttendanceDate());
			if(yesterday.equals(attendanceDate)) {
				String user = (String)memberList.get(i).getUserId();
				for(int j=0;j<memberList.size();j++) {
					if(user.equals(memberList.get(j).getUserId())) {
						memberList.remove(j);
						--j;
						i=-1;
					}
				}
			}
		}
		for(int z=0;z<memberList.size();z++) {
			String noInsertUser = memberList.get(z).getUserId();
			attendanceService.noInsertAttendance(noInsertUser);
			
		}
	}
}
