package com.study.www;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.www.dto.BoardVO;
import com.study.www.service.BoardService;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private BoardService b_service;
	
	@RequestMapping(value = {"list.do"}, method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("list start!");
		
		List<BoardVO> boardVo = b_service.BoardList();
		
		model.addAttribute("board", boardVo);
		
		return "Board/list";
	}
	
	@RequestMapping(value = {"write.do"}, method = RequestMethod.GET)
	public String write(@ModelAttribute("boardVo") BoardVO boardVo) {
		logger.info("write start!");
		
		return "Board/write";
	}
	
	@RequestMapping(value = {"write_add.do"}, method = RequestMethod.GET)
	public String write_add(@ModelAttribute("boardVo") BoardVO boardVo) {
		logger.info("write start!");
		
		return "Board/write";
	}
	
}
