package com.study.www.service;

import com.study.www.dto.UserVO;

public interface UserService {
	
	void user_add(UserVO userVo); //회원 정보 저장
	
	public UserVO login_check(UserVO userVo); //회원 정보 조회
}
