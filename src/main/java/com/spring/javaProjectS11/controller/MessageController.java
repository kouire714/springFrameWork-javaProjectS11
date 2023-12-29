package com.spring.javaProjectS11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	
	@RequestMapping(value="/message/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, String mid, Model model) {
		
		if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", mid + "님 로그인 되었습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("msg", "존재하지 않는 회원이거나 비밀번호 오류입니다.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("msg", "회원가입 되었습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberJoinNo")) {
			model.addAttribute("msg", "회원가입에 실패했습니다");
			model.addAttribute("url", "member/memberLogin");
		}
		
		return "include/message";
	}
}