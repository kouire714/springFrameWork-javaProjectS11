package com.spring.javaProjectS11.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS11.vo.RoomVO;

public interface RoomDAO {
	
	public RoomVO getRoomCheck(@Param("checkInDate") String checkInDate, @Param("checkOutDate") String checkOutDate);

	public int setRoomRes(@Param("checkInDate") String checkInDate, @Param("checkOutDate") String checkOutDate);

}
