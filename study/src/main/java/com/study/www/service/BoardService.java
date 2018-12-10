package com.study.www.service;

import java.util.List;

import com.study.www.dto.BoardVO;

public interface BoardService {
	
	public List<BoardVO> BoardList(int start, int end, String searchOption, String keyword) throws Exception; //게시글 목록 조회
	
	public void write_add(BoardVO boardVo) throws Exception; //게시글 등록
	
	public int countArticle(String searchOption, String keyword) throws Exception; // 게시판 레코드 개수
	
	public BoardVO BoardInfo(BoardVO boardVo) throws Exception; //게시글 정보
	
	public void write_update(BoardVO boardVo) throws Exception; //게시글 수정
}
