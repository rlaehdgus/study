package com.study.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.www.dto.UserVO;
import com.study.www.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserMapper u_mapper;

	@Override
	public void user_add(UserVO userVo) {
		
		u_mapper.user_add(userVo);
	}

	@Override
	public UserVO login_check(UserVO userVo) {
		
		return u_mapper.login_check(userVo);
	}
}
