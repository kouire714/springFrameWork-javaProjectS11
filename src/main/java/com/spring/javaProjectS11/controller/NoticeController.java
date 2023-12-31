package com.spring.javaProjectS11.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS11.service.NoticeService;
import com.spring.javaProjectS11.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeListGet(HttpServletRequest request) {
		
		List<NoticeVO> vos = noticeService.getNoticeList();
		
//		System.out.println("vos : " + vos);
		
		request.setAttribute("vos", vos);
		
		return "notice/noticeList";
	}
	
	@RequestMapping(value = "/noticeContent", method = RequestMethod.GET)
	public String noticeContentGet(@RequestParam(name="idx", defaultValue="", required=false) int idx,
			HttpServletRequest request) {
		
		NoticeVO vo = noticeService.getNoticeContent(idx);
		
		request.setAttribute("vo", vo);
		
		return "notice/noticeContent";
	}
	
	@RequestMapping(value = "/noticeInput", method = RequestMethod.GET)
	public String noticeInputGet() {
		return "notice/noticeInput";
	}
	
	@RequestMapping(value = "/noticeInput", method = RequestMethod.POST)
	public String noticeInputPost(
			@RequestParam(name="nickName", defaultValue="", required=false) String nickName,
			@RequestParam(name="email", defaultValue="", required=false) String email,
			@RequestParam(name="title", defaultValue="", required=false) String title,
			@RequestParam(name="content", defaultValue="", required=false) String content
			) {
		
		int res = noticeService.setNoticeInput(nickName, email, title, content);
		
		if(res != 1)
			return "redirect:/message/noticeInputNo";
		
		return "redirect:/message/noticeInputOk";
	}
}
