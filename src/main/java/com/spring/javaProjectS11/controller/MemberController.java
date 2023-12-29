package com.spring.javaProjectS11.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS11.service.MemberService;
import com.spring.javaProjectS11.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public String memberLoginGet() {
		return "member/memberLogin";
	}
	
	
	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public String memberLoginPost(
			@RequestParam(name="mid", defaultValue="", required=false) String mid,
			@RequestParam(name="pwd", defaultValue="", required=false) String pwd
			) {
		
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		if(vo != null) {
			if(vo.getPwd().equals(pwd)) {
				return "redirect:/message/memberLoginOk?mid="+ mid;
			}
		}
		return "redirect:/message/memberLoginNo";
	}
	
	@RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
	public String memberJoinGet() {
		return "member/memberJoin";
	}
	
	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public String memberJoin(
			HttpServletRequest request
//			@RequestParam(name="mid", defaultValue="", required=false) String mid,
//			@RequestParam(name="pwd", defaultValue="", required=false) String pwd,
//			@RequestParam(name="nickName", defaultValue="", required=false) String nickName,
//			@RequestParam(name="name", defaultValue="", required=false) String name,
//			@RequestParam(name="gender", defaultValue="", required=false) String gender,
//			@RequestParam(name="birth", defaultValue="", required=false) String birth,
//			@RequestParam(name="address", defaultValue="", required=false) String address,
//			@RequestParam(name="phone", defaultValue="", required=false) String phone,
//			@RequestParam(name="email", defaultValue="", required=false) String email
			) {
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String nickName = request.getParameter("nickName");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		int res = memberService.setMemberJoin(mid, pwd, nickName, name, gender, birth, address, phone, email);
		
		if(res == 1) {
			return "redirect:/message/memberJoinOk";
		}
		
		return "redirect:/message/memberJoinNo";
	}
	
}