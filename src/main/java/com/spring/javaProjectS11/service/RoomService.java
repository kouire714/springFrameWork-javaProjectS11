package com.spring.javaProjectS11.service;

import com.spring.javaProjectS11.vo.RoomVO;

public interface RoomService {

	public int setRoomRes(String checkInDate, String checkOutDate);

	public RoomVO getRoomCheck(String checkInDate, String checkOutDate);

}
