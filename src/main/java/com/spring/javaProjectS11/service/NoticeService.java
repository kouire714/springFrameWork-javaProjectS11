package com.spring.javaProjectS11.service;

import java.util.List;

import com.spring.javaProjectS11.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> getNoticeList(int startIndexNo, int pageSize);

	public NoticeVO getNoticeContent(int idx);

	public int setNoticeInput(NoticeVO vo);

	public int setNoticeUpdate(String nickName, String email, String title, String content, int idx);

	public int noticeDelete(int idx);

}
