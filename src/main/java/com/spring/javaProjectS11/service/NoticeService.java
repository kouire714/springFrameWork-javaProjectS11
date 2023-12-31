package com.spring.javaProjectS11.service;

import java.util.List;

import com.spring.javaProjectS11.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> getNoticeList();

	public NoticeVO getNoticeContent(int idx);

	public int setNoticeInput(String nickName, String email, String title, String content);

}
