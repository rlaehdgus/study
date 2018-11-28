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
	
	public List<BoardVO> BoardList() {
		
		return b_mapper.BoardList();
	}

	@Override
	public void write_add(BoardVO boardVo) {
		
		b_mapper.write_add(boardVo);
	}
	
	
}
