package com.spring.javaProjectS11.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS11.vo.NoticeVO;

public interface NoticeDAO {

	List<NoticeVO> getNoticeList();

	NoticeVO getNoticeContent(@Param("idx")int idx);

	int setNoticeInput(@Param("nickName")String nickName, @Param("email")String email, @Param("title")String title, @Param("content")String content);

}
