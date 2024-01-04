package com.spring.javaProjectS11.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.NoticeDAO;
import com.spring.javaProjectS11.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> getNoticeList() {
		return noticeDAO.getNoticeList();
	}

	@Override
	public NoticeVO getNoticeContent(int idx) {
		return noticeDAO.getNoticeContent(idx);
	}

	@Override
	public int setNoticeInput(String nickName, String email, String title, String content) {
		return noticeDAO.setNoticeInput(nickName, email, title, content);
	}
	
}
