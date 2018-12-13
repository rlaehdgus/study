package com.study.www;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.www.dto.BoardVO;
import com.study.www.service.BoardPager;
import com.study.www.service.BoardService;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private BoardService b_service;
	
	@RequestMapping(value = {"/board_list.do"}, method = RequestMethod.GET)
	public ModelAndView board_list(@RequestParam(defaultValue="null") String searchOption, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage) throws Exception {
		logger.info("board_list start!");
		
		//레코드의 갯수 계산
		int count = b_service.countArticle(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<BoardVO> list = b_service.BoardList(start, end, searchOption, keyword);
				
		//데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("Board/board_list");
		
		return mav;
	}
	
	@RequestMapping(value = {"/board_write.do"}, method = RequestMethod.GET)
	public String board_write(@ModelAttribute("boardVo") BoardVO boardVo) {
		logger.info("board_write start!");
		
		return "Board/board_write";
	}
	
	@RequestMapping(value = {"/write_add.do"}, method = RequestMethod.POST)
	public String write_add(@ModelAttribute("boardVo") BoardVO boardVo, HttpServletRequest req) throws Exception {
		logger.info("write_add start!");
		
		b_service.write_add(boardVo);
		
		return "redirect:board_list.do";
	}
	
	@RequestMapping(value = {"/board_view.do"}, method = RequestMethod.GET)
	public String board_view(@ModelAttribute("boardVo") BoardVO boardVo, Model model) throws Exception {
		logger.info("board_view start!");
		
		boardVo = b_service.BoardInfo(boardVo);
		
		model.addAttribute("board", boardVo);
		
		return "Board/board_view";
	}
	
	@RequestMapping(value = {"/board_update.do"}, method = RequestMethod.GET)
	public String board_update(@ModelAttribute("boardVo") BoardVO boardVo, Model model) throws Exception {
		logger.info("board_update start!");
		
		boardVo = b_service.BoardInfo(boardVo);
		
		model.addAttribute("board", boardVo);
		
		return "Board/board_update";
	}
	
	@RequestMapping(value = {"/write_update.do"}, method = RequestMethod.POST)
	public String write_update(@ModelAttribute("boardVo") BoardVO boardVo) throws Exception {
		logger.info("write_update start!");
		
		b_service.write_update(boardVo);
		
		return "redirect:board_list.do";
	}
	
}
