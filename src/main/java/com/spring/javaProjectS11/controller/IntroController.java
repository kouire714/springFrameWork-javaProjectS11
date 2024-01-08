package com.spring.javaProjectS11.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/intro")
public class IntroController {
	
	@RequestMapping("/introMain")
	public String introMainGet() {
		return "intro/introMain";
	}
}
