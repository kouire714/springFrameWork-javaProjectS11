package com.spring.javaProjectS11.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS11.pagination.PageProcess;
import com.spring.javaProjectS11.pagination.PageVO;
import com.spring.javaProjectS11.service.NoticeService;
import com.spring.javaProjectS11.vo.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeListGet(HttpServletRequest request,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize
			){
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "notice", "", "");
		
		List<NoticeVO> vos = noticeService.getNoticeList(pageVO.getStartIndexNo(),pageSize);
		
//		System.out.println("vos : " + vos);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pageVO", pageVO);
		
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
	public String noticeInputPost(NoticeVO vo) {
		
		int res = noticeService.setNoticeInput(vo);
		
		if(res != 1)
			return "redirect:/message/noticeInputNo";
		
		return "redirect:/message/noticeInputOk";
	}
	
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpDateGet(@RequestParam(name="idx", defaultValue="", required=false) int idx,
			HttpServletRequest request) {
		
		NoticeVO vo = noticeService.getNoticeContent(idx);
		request.setAttribute("idx", idx);
		request.setAttribute("vo", vo);
		
		return "notice/noticeUpdate";
	}
	
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpDateGet(
			@RequestParam(name="nickName", defaultValue="", required=false) String nickName,
			@RequestParam(name="email", defaultValue="", required=false) String email,
			@RequestParam(name="title", defaultValue="", required=false) String title,
			@RequestParam(name="content", defaultValue="", required=false) String content,
			@RequestParam(name="idx", defaultValue="", required=false) int idx) {
		
		int res = noticeService.setNoticeUpdate(nickName, email, title, content, idx);
		
		if(res != 1) {
			return "redirect:/message/noticeUpdateNo";
		}		
		return "redirect:/message/noticeUpdateOk";
	}
	
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam(name="idx",  defaultValue="", required=false) int idx) {
		
		int res = noticeService.noticeDelete(idx);
		
		if(res != 1) {
			return "redirect:/message/noticeDeleteNo";
		}
		
		return "redirect:/message/noticeDeleteOk";
		
	}
}
