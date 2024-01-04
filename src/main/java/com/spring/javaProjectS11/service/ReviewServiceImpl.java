package com.spring.javaProjectS11.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.ReviewDAO;
import com.spring.javaProjectS11.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public List<ReviewVO> getReviewList() {
		return reviewDAO.getReviewList();
	}

	@Override
	public ReviewVO getReviewContent(String idx) {
		return reviewDAO.getReviewContent(idx);
	}

	@Override
	public int setReviewInput(String nickName, String email, String title, String content) {
		return reviewDAO.setReviewInput(nickName, email, title, content);
	}
}
