package com.spring.javaProjectS11.controller;

import java.time.LocalDate;
import java.time.Month;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS11.service.RoomService;

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
		
		return "room/roomMain";
	}
	
	@RequestMapping(value="roomMain", method=RequestMethod.POST)
	public String roomMainPost(HttpServletRequest request) {
		int startResYear = Integer.parseInt(request.getParameter("startResYear"));
		int startResMonth = Integer.parseInt(request.getParameter("startResMonth"));
		int startResDate = Integer.parseInt(request.getParameter("startResDate"));
		
		// int 날짜로묶기
		
		int endResYear = Integer.parseInt(request.getParameter("endResYear"));
		int endResMonth = Integer.parseInt(request.getParameter("endResMonth"));
		int endResDate = Integer.parseInt(request.getParameter("endResDate"));
		
		int res = roomService.setRoomReservation();
		
		return "redirect:message/reservationOk";
	}
}
