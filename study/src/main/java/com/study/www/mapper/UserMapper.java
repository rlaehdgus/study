package com.study.www.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.www.dto.UserVO;

@Repository
public class UserMapper {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.study.www.mapper.UserMapper";
	
	public void user_add(UserVO userVo) {
		sqlSession.insert(Namespace+".user_add", userVo);
	}
	
	public UserVO login_check(UserVO userVo) {
		return sqlSession.selectOne(Namespace+".login_check", userVo);
	}
}
