package com.study.www;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
		
		u_service.user_add(userVo);
		
		return "Member/sign_in";
	}
	
	@RequestMapping(value = {"/login_check.do"}, method = RequestMethod.POST)
	public String login_check(@ModelAttribute("UserVO") UserVO userVo, Model model, HttpSession session) {
		logger.info("user_add start!");
		
		String returnUrl = "";
		
		//세션이 있을 경우 세션 초기화
		if(session.getAttribute("userVo.u_id") != null) {
			session.invalidate();
		}
		
		//로그인 할 정보를 usreVo 변수에 저장
		userVo = u_service.login_check(userVo);
		
		if(session.getAttribute("userVo.u_id") == null) {
			session.setAttribute("userVo", userVo);
			returnUrl = "Main/main";
		} else {
			returnUrl = "";
		}
		
		return returnUrl;
	}
	
}
