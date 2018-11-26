package com.study.www.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.www.dto.BoardVO;

@Repository
public class BoardMapper {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.study.www.mapper.BoardMapper";
	
	//게시글 목록 조회
	public List<BoardVO> BoardList() {
		
		return sqlSession.selectList(Namespace+".BoardList");
	}
	
	//게시글 등록
	public void board_add(BoardVO boardVo) {
		
		sqlSession.insert(Namespace+".board_add", boardVo);
	}
}
