package com.spring.javaProjectS11.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	@RequestMapping(value = { "/", "/h" }, method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/imageUpload", method = RequestMethod.GET)
	public void imageUploadGet(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		String oFileName = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		oFileName = sdf.format(date) + "_" + oFileName;
		
		
	}
	
}
