package com.spring.javaProjectS11.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	
	@RequestMapping(value="/message/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(
			@PathVariable String msgFlag, String nickName, Model model
			) {
		
		if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", nickName + "님 로그인 되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("msg", "존재하지 않는 회원이거나 비밀번호 오류입니다.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("memberLogout")) {
			model.addAttribute("msg", nickName + "님 로그아웃 되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("msg", "회원가입 되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("memberJoinNo")) {
			model.addAttribute("msg", "회원가입에 실패했습니다.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("reviewInputOk")) {
			model.addAttribute("msg", "리뷰를 등록하였습니다.");
			model.addAttribute("url", "review/reviewList");
		}
		else if(msgFlag.equals("reviewInputNo")) {
			model.addAttribute("msg", "리뷰를 등록을 실패하였습니다.");
			model.addAttribute("url", "review/reviewInput");
		}
		else if(msgFlag.equals("noticeInputOk")) {
			model.addAttribute("msg", "공지를 등록하였습니다.");
			model.addAttribute("url", "notice/noticeList");
		}
		else if(msgFlag.equals("noticeInputNo")) {
			model.addAttribute("msg", "공지등록을 실패하였습니다.");
			model.addAttribute("url", "notice/noticeInput");
		}

		
		return "include/message";
	}
}