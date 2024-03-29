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
	public List<NoticeVO> getNoticeList(int startIndexNo, int pageSize) {
		return noticeDAO.getNoticeList(startIndexNo, pageSize);
	}

	@Override
	public NoticeVO getNoticeContent(int idx) {
		return noticeDAO.getNoticeContent(idx);
	}

	@Override
	public int setNoticeInput(NoticeVO vo) {
		return noticeDAO.setNoticeInput(vo);
	}

	@Override
	public int setNoticeUpdate(String nickName, String email, String title, String content, int idx) {
		return noticeDAO.setNoticeUpdate(nickName, email, title, content, idx);
	}

	@Override
	public int noticeDelete(int idx) {
		return noticeDAO.noticeDelete(idx);
	}
	
}
