package com.spring.javaProjectS11.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS11.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> getNoticeList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize);

	public NoticeVO getNoticeContent(@Param("idx")int idx);

	public int setNoticeInput(@Param("vo")NoticeVO vo);

	public int setNoticeUpdate(@Param("nickName")String nickName, @Param("email")String email, @Param("title")String title, @Param("content")String content, @Param("idx")int idx);

	public int noticeDelete(@Param("idx") int idx);
	
	public int totRecCnt();
	
	public int totRecCntSearch(@Param("search") String search, @Param("searchString") String searchString);

}
