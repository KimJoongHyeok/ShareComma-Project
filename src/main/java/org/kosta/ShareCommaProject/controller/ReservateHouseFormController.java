package org.kosta.ShareCommaProject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservateHouseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// TODO Auto-generated method stub
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("예약하기는 post 방식만 허용됩니다");
    
    HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null)
			return "redirect:HouseListController.do";
    
		System.out.println("hid check:"+request.getParameter("houseId")); 
		request.setAttribute("url", "board/reservation-form.jsp");
		request.setAttribute("houseId", request.getParameter("houseId"));

		return "layout.jsp";
	}

}
