package com.spring.javaProjectS11.service;

import java.util.List;

import com.spring.javaProjectS11.vo.RoomVO;

public interface RoomService {

	public List<RoomVO> getRoomRes(String ym);

	public List<RoomVO> getRoomCheck(String checkInDate, String checkOutDate);
	
	public int setRoomRes(String checkInDate, String checkOutDate);

}
