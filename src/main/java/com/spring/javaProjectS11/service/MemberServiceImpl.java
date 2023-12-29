package com.spring.javaProjectS11.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS11.dao.MemberDAO;
import com.spring.javaProjectS11.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberVO getMemberIdCheck(String mid) {
		return memberDAO.getMemberIdCheck(mid);
	}

	@Override
	public int setMemberJoin(String mid, String pwd, String nickName, String name, String gender, String birth,
			String address, String phone, String email) {
		return memberDAO.setMemberJoin(mid, pwd, nickName, name, gender, birth, address, phone, email);
	}

}
