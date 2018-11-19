package com.study.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.www.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserMapper u_mapper;
}
