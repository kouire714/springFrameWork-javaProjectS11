package com.spring.javaProjectS11.controller;

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
	public String roomMain(HttpServletRequest request, Model model) {
		
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
		System.out.println("LastDay : " + lastDay);
		
		int prevYear = yy;
		int prevMonth = mm - 1;
		int nextYear = yy;
		int nextMonth = mm + 1;
		
		if(prevMonth < 0) {
			prevMonth = 11;
			prevYear--;
		}
		else if(prevMonth > 11) {
			prevMonth = 0;
			prevYear++;
		}
		
		cal.set(prevYear, prevMonth, 1);
		
		int prevLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println("prevLastDay : " + prevLastDay);
		
		return "room/roomMain";
	}
	
}
