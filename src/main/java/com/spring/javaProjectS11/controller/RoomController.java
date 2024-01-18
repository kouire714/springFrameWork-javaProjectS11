package com.spring.javaProjectS11.controller;

import java.time.LocalDate;
import java.time.Month;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaProjectS11.service.RoomService;
import com.spring.javaProjectS11.vo.RoomVO;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	RoomService roomService;
	
	@RequestMapping(value = "/roomMain", method = RequestMethod.GET)
	public String roomMainGet(HttpServletRequest request, Model model) {

		Calendar cal = Calendar.getInstance();
		int curYear = cal.get(Calendar.YEAR);
		int curMonth = cal.get(Calendar.MONTH);
		int curDate = cal.get(Calendar.DATE);
		
		int yy = request.getParameter("yy")==null ? curYear : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm")==null ? curMonth : Integer.parseInt(request.getParameter("mm"));
		
		if(mm < 0) {
			mm = 11;
			yy--;
		}
		else if(mm > 11) {
			mm = 0;
			yy++;
		}
		
		cal.set(yy, mm, 1);
		
		int startWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		int prevYear = yy;
		int prevMonth = mm - 1;
		int nextYear = yy;
		int nextMonth = mm + 1;
		
		if(prevMonth < 0) {
			prevMonth = 11;
			prevYear--;
		}
		else if(nextMonth > 11) {
			nextMonth = 0;
			nextYear++;
		}
		
		cal.set(prevYear, prevMonth, 1);
		int prevLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		cal.set(nextYear, nextMonth, 1);
		int nextStartWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		model.addAttribute("curYear", curYear);
		model.addAttribute("curMonth", curMonth);
		model.addAttribute("curDate", curDate);

		model.addAttribute("yy", yy);
		model.addAttribute("mm", mm);
		model.addAttribute("startWeek", startWeek);
		model.addAttribute("lastDay", lastDay);
		
		model.addAttribute("prevYear", prevYear);
		model.addAttribute("prevMonth", prevMonth);
		model.addAttribute("prevLastDay", prevLastDay);

		model.addAttribute("nextYear", nextYear);
		model.addAttribute("nextMonth", nextMonth);
		model.addAttribute("nextStartWeek", nextStartWeek);
		
		LocalDate localDate = LocalDate.now();
		int year = localDate.getYear();
		Month monthInstance = localDate.getMonth();
		int month = monthInstance.getValue();
		int date = localDate.getDayOfMonth();
		
		model.addAttribute("curYearSec", year);
		model.addAttribute("curMonthSec", month);
		model.addAttribute("curDateSec", date);
		
		String ym = "";
		if((mm+1) < 10) ym = yy + "-0" + (mm+1);
		else ym = yy + "-" + (mm+1);
		
		List<RoomVO> vos = roomService.getRoomRes(ym);
		
		model.addAttribute("vos", vos);
		System.out.println("vos : " + vos);
		
		return "room/roomMain";
	}
	
	@ResponseBody
	@RequestMapping(value="/roomMain", method=RequestMethod.POST)
	public String roomMainPost(HttpServletRequest request) {		
		
		int startResYear = Integer.parseInt(request.getParameter("startResYear"));
		int startResMonth = Integer.parseInt(request.getParameter("startResMonth"));
		int startResDate = Integer.parseInt(request.getParameter("startResDate"));
		
		String checkInDate = startResYear+"-"+startResMonth+"-"+startResDate;
		
		int endResYear = Integer.parseInt(request.getParameter("endResYear"));
		int endResMonth = Integer.parseInt(request.getParameter("endResMonth"));
		int endResDate = Integer.parseInt(request.getParameter("endResDate"));
		
		String checkOutDate = endResYear+"-"+endResMonth+"-"+endResDate;
		
		String sMm = "", eDd = "";
		String[] sCheckInDate = checkInDate.split("-");
		// 2023-1-5/2023-1-15/2023-10-5  ==> 2023-01-05
		if(checkInDate.length() != 10) {
			if(sCheckInDate[1].length() == 1) sMm = "0" + sCheckInDate[1];
			else sMm = sCheckInDate[1];
			if(sCheckInDate[2].length() == 1) eDd = "0" + sCheckInDate[2];
			else eDd = sCheckInDate[2];
			checkInDate = sCheckInDate[0] + "-" + sMm + "-" + eDd;
		}
		System.out.println("checkInDate : " + checkInDate);
		
		String eMmSec = "", eDdSec = "";
		String[] sCheckOutDate = checkOutDate.split("-");
		// 2023-1-5/2023-1-15/2023-10-5  ==> 2023-01-05
		if(checkOutDate.length() != 10) {
			if(sCheckOutDate[1].length() == 1) eMmSec = "0" + sCheckOutDate[1];
			else eMmSec = sCheckOutDate[1];
			if(sCheckOutDate[2].length() == 1) eDdSec = "0" + sCheckOutDate[2];
			else eDdSec = sCheckOutDate[2];
			checkOutDate = sCheckOutDate[0] + "-" + eMmSec + "-" + eDdSec;
		}
		System.out.println("checkOutDate : " + checkOutDate);
		
		// 예약 중복체크..
		RoomVO roomVO = roomService.getRoomCheck(checkInDate, checkOutDate);
		
		int resDate = checkInDate.compareTo(checkOutDate);
		
		if(resDate < 0) {
			if(roomVO == null) {
				int res = roomService.setRoomRes(checkInDate, checkOutDate);
				return res + "";		
			}
			else return "0";
		}
		else {
			return "-1";
		}
	}
}
