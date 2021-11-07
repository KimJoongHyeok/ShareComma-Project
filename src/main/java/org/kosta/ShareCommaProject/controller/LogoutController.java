package org.kosta.ShareCommaProject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("로그아웃은 post방식만 가능합니다");
		HttpSession session=request.getSession(false);//기존 세션이 있으면 기존 세션반환 , 없으면 null 반환 
		if(session!=null)
			session.invalidate();//세션을 무효화시킨다 
		return "redirect:HouseListController.do";
	}

}
