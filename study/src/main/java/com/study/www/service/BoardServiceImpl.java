package com.study.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.www.dto.BoardVO;
import com.study.www.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardMapper b_mapper;
	
	public List<BoardVO> BoardList(int start, int end, String searchOption, String keyword) throws Exception {
		
		return b_mapper.BoardList(start, end, searchOption, keyword);
	}

	@Override
	public void write_add(BoardVO boardVo) throws Exception {
		
		b_mapper.write_add(boardVo);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return b_mapper.countArticle(searchOption, keyword);
	}

	@Override
	public BoardVO BoardInfo(BoardVO boardVo) throws Exception {
		
		return b_mapper.boardInfo(boardVo);
	}
	
	@Override
	public void write_update(BoardVO boardVo) throws Exception {
		
		b_mapper.write_update(boardVo);
	}
	
}
