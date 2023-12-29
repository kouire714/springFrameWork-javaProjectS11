package com.spring.javaProjectS11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS11.service.ReivewService;
import com.spring.javaProjectS11.vo.ReivewVO;

@Controller
@RequestMapping("/reivew")
public class ReivewController {
	
	@Autowired
	ReivewService reivewService;
	
	@RequestMapping(value = "/reivewList", method = RequestMethod.GET)
	public String reivewListget(Model model) {
		
		List<ReivewVO> vos = reivewService.getReivewList();
		
		model.addAttribute(vos);
		
		return "reivew/reivewList";
	}
}
