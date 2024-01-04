package com.spring.javaProjectS11.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS11.service.ReviewService;
import com.spring.javaProjectS11.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewListGet(Model model) {
		
		List<ReviewVO> vos = reviewService.getReviewList();
		
		model.addAttribute("vos", vos);

		return "review/reviewList";
	}
	
	@RequestMapping(value="/reviewContent", method = RequestMethod.GET)
	public String reviewContentGet(HttpServletRequest request) {
		
		String idx = request.getParameter("idx");
		ReviewVO vo = reviewService.getReviewContent(idx);
		
		request.setAttribute("vo", vo);
//		request.getAttribute("vo");
//		model.addAttribute("vo", vo);
		
		return "review/reviewContent";
	}
	
	@RequestMapping(value = "reviewInput", method = RequestMethod.GET)
	public String reviewInputGet() {
		return "review/reviewInput";
	}
	
	@RequestMapping(value = "reviewInput", method = RequestMethod.POST)
	public String reviewInputPost(
			@RequestParam("nickName") String nickName,
			@RequestParam String email,
			String title,
			@RequestParam(name="content", defaultValue="", required=false) String content
			) {
		int res = reviewService.setReviewInput(nickName, email, title, content);
		if(res != 1) {
			return "redirect:/message/reviewInputNo";
		}
		
		return "redirect:/message/reviewInputOk";
	}
	
}
