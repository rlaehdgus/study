package com.study.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class); //Log ��ü ����
	
	/* ��ó���� �޼���(Controller�� ����Ǳ� ���� ����ȴ� */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(log.isDebugEnabled()) {
			log.debug("========================================= START ========================================="); //��û�� �������� ��輱
			log.debug(" Reguest URI \t:  "+request.getRequestURI()); //���� ȣ��� URI�� �������� ������
		}
		return super.preHandle(request, response, handler);
	}
	
	/* ��ó���� �޼���(Controller�� ����� �� ȣ��ȴ�.) */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		log.debug("========================================= END ========================================="); //��û�� �������� ��輱
	}
}
