package com.study.www;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.api.Session;
import com.study.www.dto.UserVO;
import com.study.www.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private UserService u_service;
	
	@RequestMapping(value = {"/user_add.do"}, method = RequestMethod.POST)
	public String user_add(@ModelAttribute("UserVO") UserVO userVo) {
		logger.info("user_add start!");
		
		//회원가입 할 정보 저장
		u_service.user_add(userVo);
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value = {"/login_check.do"}, method = RequestMethod.POST)
	public String login_check(@ModelAttribute("UserVO") UserVO userVo, Model model, HttpSession session) {
		logger.info("user_add start!");
		
		//세션이 있을 경우 세션 초기화
		if(session.getAttribute("member") != null) {
			session.invalidate();
		}
		
		//로그인 할 정보를 usreVo 변수에 저장
		userVo = u_service.user_check(userVo);

		//세션이 없을 경우 로그인 값을 세션에 저장
		if(session.getAttribute("member") == null) {
			session.setAttribute("member", userVo);
		}
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value = {"/logout.do"}, method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("logout start!");
		
		session.invalidate();
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value = {"/mypage.do"}, method = RequestMethod.GET)
	public String mypage(@ModelAttribute("userVo") UserVO userVo) {
		logger.info("mypage start!");
		
		return "Member/mypage";
	}
	
	@RequestMapping(value = {"/user_update.do"}, method = RequestMethod.POST)
	public String user_update(@ModelAttribute("userVo") UserVO userVo, HttpSession session) {
		logger.info("user_update start!");
		
		//회원 정보가 변경된 데이터를 저장
		u_service.user_update(userVo);
		
		//회원 정보가 변경된 데이터를 변수에 저장
		userVo = u_service.user_check(userVo);
		
		//회원 정보를 세션에 저장
		session.setAttribute("member", userVo);
		
		return "redirect:mypage.do";
	}
	
	
	
}
