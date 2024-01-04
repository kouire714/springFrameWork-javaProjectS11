package com.spring.javaProjectS11.service;

import java.util.List;

import com.spring.javaProjectS11.vo.ReviewVO;

public interface ReviewService {

	List<ReviewVO> getReviewList();

	ReviewVO getReviewContent(String idx);

	int setReviewInput(String nickName, String email, String title, String content);
}
