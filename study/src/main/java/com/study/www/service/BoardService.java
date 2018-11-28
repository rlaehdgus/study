package com.study.www.service;

import java.util.List;

import com.study.www.dto.BoardVO;

public interface BoardService {
	
	public List<BoardVO> BoardList(); //게시글 목록 조회
	
	public void write_add(BoardVO boardVo); //게시글 등록
}
