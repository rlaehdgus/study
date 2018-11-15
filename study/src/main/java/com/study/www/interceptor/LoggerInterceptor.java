package com.study.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class); //Log 객체 생성
	
	/* 전처리기 메서드(Controller가 실행되기 전에 실행된다 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(log.isDebugEnabled()) {
			log.debug("========================================= START ========================================="); //요청을 보기위한 경계선
			log.debug(" Reguest URI \t:  "+request.getRequestURI()); //현재 호출된 URI가 무엇인지 보여줌
		}
		return super.preHandle(request, response, handler);
	}
	
	/* 후처리기 메서드(Controller가 실행된 후 호출된다.) */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		log.debug("========================================= END ========================================="); //요청을 보기위한 경계선
	}
}
