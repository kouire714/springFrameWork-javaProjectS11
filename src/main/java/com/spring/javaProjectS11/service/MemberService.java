package com.spring.javaProjectS11.service;

import com.spring.javaProjectS11.vo.MemberVO;


public interface MemberService {

	public MemberVO getMemberIdCheck(String mid);

	public int setMemberJoin(String mid, String pwd, String nickName, String name, String gender, String birth,
			String address, String phone, String email);

}
