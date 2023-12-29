package com.spring.javaProjectS11.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.ReivewDAO;
import com.spring.javaProjectS11.vo.ReivewVO;

@Service
public class ReivewServiceImpl implements ReivewService {

	@Autowired
	ReivewDAO reivewDAO;

	@Override
	public List<ReivewVO> getReivewList() {
		return reivewDAO.getReivewList();
	}
}
