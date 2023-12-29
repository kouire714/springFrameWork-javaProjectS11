package com.spring.javaProjectS11.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS11.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemberIdCheck(@Param("mid") String mid);

	public int setMemberJoin(@Param("mid")String mid, @Param("pwd")String pwd, @Param("nickName")String nickName, @Param("name")String name, 
			@Param("gender")String gender, @Param("birth")String birth, @Param("address")String address, @Param("phone")String phone, 
			@Param("email")String email);
}
