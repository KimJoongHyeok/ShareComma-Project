package org.kosta.ShareCommaProject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservateHouseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("예약하기는 post 방식만 허용됩니다");
		
		System.out.println(request.getParameter("hid")); 
		request.setAttribute("url", "board/reservation-form.jsp");
		request.setAttribute("hid", request.getParameter("hid"));
		
		return "layout.jsp";
 
	}

}
