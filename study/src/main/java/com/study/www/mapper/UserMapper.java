package com.study.www.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserMapper {
	
	@Inject
	private SqlSession sqlSession;
	
	
}
