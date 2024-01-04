package com.spring.javaProjectS11.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS11.vo.ReviewVO;

public interface ReviewDAO {

	List<ReviewVO> getReviewList();

	ReviewVO getReviewContent(@Param("idx")String idx);

	int setReviewInput(@Param("nickName")String nickName, @Param("email")String email, @Param("title")String title, @Param("content")String content);

}
