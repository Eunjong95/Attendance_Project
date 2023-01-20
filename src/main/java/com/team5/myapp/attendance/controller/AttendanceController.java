package com.team5.myapp.attendance.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import com.team5.myapp.attendance.model.Attendance;
import com.team5.myapp.attendance.service.IAttendanceService;

@Controller
public class AttendanceController {
	static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Autowired
	IAttendanceService attendanceService;
	
	//출근 
	@ResponseBody
	@RequestMapping(value="/worktime", method=RequestMethod.GET)
	public Attendance clockIn(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		Attendance attendance = attendanceService.selectAttendance(userId);
		
		if(attendance == null) {	
			attendanceService.insertWorktime(userId);
			System.out.println("출근체크함");
		}else {
			System.out.println("이미 출근 체크 했습니다.");
			return null;
		}
		attendance = attendanceService.selectAttendance(userId);
		return attendance;
	}
	
	//퇴근
	@ResponseBody
	@RequestMapping(value="/worktime", method=RequestMethod.POST)
	public Attendance clockOut(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		Attendance attendance = attendanceService.selectAttendance(userId);
		if(attendance.getClockOut() == null) {			
			attendanceService.updateWorktime(userId);
			System.out.println("퇴근체크함");
			attendance = attendanceService.selectAttendance(userId);
			
			//status 변경
			System.out.println("출결 조회 정보 가져오기");
			int attendanceStatus = attendance.getStatus();
			System.out.println("출결상태 확인1 :"+attendanceStatus);
			
			Timestamp attendanceClockIn = attendance.getClockIn();
			System.out.println("출근 시간 : "+attendanceClockIn);
			Timestamp attendanceClockOut = attendance.getClockOut();
			System.out.println("퇴근 시간 : "+attendanceClockOut);
			Calendar calIn = Calendar.getInstance();
			Calendar calOut = Calendar.getInstance();
			
			calIn.setTimeInMillis(attendanceClockIn.getTime());
			calOut.setTimeInMillis(attendanceClockOut.getTime());
			int hour = calOut.get(Calendar.HOUR_OF_DAY) - calIn.get(Calendar.HOUR_OF_DAY);
			System.out.println("출근 hour: "+calIn.get(Calendar.HOUR_OF_DAY));
			System.out.println("퇴근 hour: "+calOut.get(Calendar.HOUR_OF_DAY));
			
			System.out.println("금일 근무시간 : "+hour);
			if(!attendanceClockOut.equals(null)) {
				if((calIn.get(Calendar.HOUR_OF_DAY)>=9)&&(calIn.get(Calendar.HOUR_OF_DAY)<10)&&(hour>=9)) {
					attendanceStatus = 2; //지각
				}else if((calIn.get(Calendar.HOUR_OF_DAY)==8)&& hour>=10) {
					attendanceStatus = 0; // 정상출근
				}else if(hour<=9 && hour>=4) {
		            attendanceStatus = 4; // 조퇴
				}else {
					attendanceStatus = 1; //결근
				}
			}
			System.out.println("출결상태 확인2 :"+attendanceStatus);
			attendanceService.updateAttendanceStatus(attendanceStatus,userId);
		}else {
			System.out.println("이미 퇴근 체크 했습니다.");
		}
		System.out.println("--------------------------------------------");
		
		return attendance;
	}
	
	//출결현황
	@RequestMapping(value="/attendance/list/{page}")
	public String getAttendanceList(@PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		String userId = (String) session.getAttribute("userId");
		
		List<Attendance> attendanceList = attendanceService.selectAttendanceList(userId, page);
		List<Attendance> calendarList = attendanceService.selectCalendarList(userId);
		//출근 횟수
		int attendanceCount = attendanceService.selectAttendanceCount(userId);
		model.addAttribute("attendanceCount",attendanceCount);
		//지각 횟수
		int lateCount = attendanceService.selectLateCount(userId);
		model.addAttribute("lateCount",lateCount);
		//조퇴 횟수
		int leaveCount = attendanceService.selectLeaveCount(userId);
		model.addAttribute("leaveCount",leaveCount);
		//결근 횟수
		int absenceCount = attendanceService.selectAbsenceCount(userId);
		model.addAttribute("absenceCount",absenceCount);
		
		//출석률
		double attendancePercent = 0;
		int chageLateCount = 0;
		
		if(lateCount%3==0) {
			chageLateCount = (lateCount/3);
			attendancePercent = ((attendanceCount+(double)lateCount-chageLateCount)/(attendanceCount+lateCount+leaveCount+absenceCount))*100;
		}else {
			attendancePercent =  ((attendanceCount+(double)lateCount)/(attendanceCount+lateCount+leaveCount+absenceCount))*100;
		}
		model.addAttribute("attendancePercent",attendancePercent);
		
		//paging start
		int myAttendanceListCount = attendanceService.selectTotalAttendancePage(userId);
		int totalPage = 0;
		if(myAttendanceListCount>0) {
			totalPage = (int)Math.ceil(myAttendanceListCount/5.0);
		}
		model.addAttribute("attendanceList",attendanceList);
		model.addAttribute("calendarList",calendarList);
		model.addAttribute("totalPageCount",totalPage);
		model.addAttribute("page",page);

		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("MM");
		String month = format.format(date.getTime());
		model.addAttribute("month",month);
		
		return "attendance/list";
	}
	
	@RequestMapping(value="/attendance/list")
	public String getAttendanceList(HttpSession session, Model model) {
		
		return getAttendanceList(1,session,model);
	}
	
	//출결현황(관리자)
	@RequestMapping(value="/admin/attendance/view/{page}/{userId}")
	public String getMemberAttendanceList(@PathVariable int page,@PathVariable String userId ,HttpSession session, Model model) {
		session.setAttribute("page", page);
		
		List<Attendance> attendanceList = attendanceService.selectAttendanceList(userId, page);
		List<Attendance> calendarList = attendanceService.selectCalendarList(userId);
		//출근 횟수
		int attendanceCount = attendanceService.selectAttendanceCount(userId);
		model.addAttribute("attendanceCount",attendanceCount);
		//지각 횟수
		int lateCount = attendanceService.selectLateCount(userId);
		model.addAttribute("lateCount",lateCount);
		//조퇴 횟수
		int leaveCount = attendanceService.selectLeaveCount(userId);
		model.addAttribute("leaveCount",leaveCount);
		//결근 횟수
		int absenceCount = attendanceService.selectAbsenceCount(userId);
		model.addAttribute("absenceCount",absenceCount);
		
		//출석률
		double attendancePercent = 0;
		int chageLateCount = 0;
		
		if(lateCount%3==0) {
			chageLateCount = (lateCount/3);
			attendancePercent = ((attendanceCount+(double)lateCount-chageLateCount)/(attendanceCount+lateCount+leaveCount+absenceCount))*100;
		}else {
			attendancePercent =  ((attendanceCount+(double)lateCount)/(attendanceCount+lateCount+leaveCount+absenceCount))*100;
		}
		model.addAttribute("attendancePercent",attendancePercent);
		
		//paging start
		int myAttendanceListCount = attendanceService.selectTotalAttendancePage(userId);
		int totalPage = 0;
		if(myAttendanceListCount>0) {
			totalPage = (int)Math.ceil(myAttendanceListCount/5.0);
		}
		model.addAttribute("attendanceList",attendanceList);
		model.addAttribute("calendarList",calendarList);
		model.addAttribute("totalPageCount",totalPage);
		model.addAttribute("page",page);
		model.addAttribute("userId",userId);
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		SimpleDateFormat format = new SimpleDateFormat("MM");
		String month = format.format(date.getTime());
		model.addAttribute("month",month);
		
		return "admin/member/memberAttendance";
	}
	
	@RequestMapping(value="/admin/attendance/view/{userId}")
	public String getMemberAttendanceList(@PathVariable String userId,HttpSession session, Model model) {
		
		return getMemberAttendanceList(1,userId,session,model);
	}
	
}
