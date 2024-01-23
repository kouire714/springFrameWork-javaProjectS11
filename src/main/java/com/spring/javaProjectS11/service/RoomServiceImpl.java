package com.spring.javaProjectS11.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.RoomDAO;
import com.spring.javaProjectS11.vo.RoomVO;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	RoomDAO serviceDAO;

	@Override
	public List<RoomVO> getRoomRes(String ym) {
		return serviceDAO.getRoomRes(ym);
	}
	
	@Override
	public List<RoomVO> getRoomCheck(String checkInDate, String checkOutDate) {
		return serviceDAO.getRoomCheck(checkInDate, checkOutDate);
	}
	
	@Override
	public int setRoomRes(String checkInDate, String checkOutDate) {
		return serviceDAO.setRoomRes(checkInDate, checkOutDate);
	}


	
}
