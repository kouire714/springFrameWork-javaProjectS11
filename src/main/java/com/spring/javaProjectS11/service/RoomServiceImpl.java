package com.spring.javaProjectS11.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.RoomDAO;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	RoomDAO serviceDAO;

	@Override
	public int setRoomReservation() {
		return serviceDAO.setRoomReservation();
	}
}
