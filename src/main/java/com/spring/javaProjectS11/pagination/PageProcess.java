package com.spring.javaProjectS11.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.NoticeDAO;

@Service
public class PageProcess {

	@Autowired
	NoticeDAO noticeDAO;
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		String search = "";
		
		if(section.equals("notice")) {
			if(part.equals("")) totRecCnt = noticeDAO.totRecCnt();
			else {
				search = part;
				totRecCnt = noticeDAO.totRecCntSearch(search, searchString);
			}
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		
		return pageVO;
	}
}
