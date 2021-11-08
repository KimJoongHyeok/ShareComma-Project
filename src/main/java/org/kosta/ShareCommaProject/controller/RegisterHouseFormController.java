package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterHouseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setAttribute("url", "board/register-house-form.jsp");
		request.setAttribute("mid", request.getParameter("mid"));
		
		return "layout.jsp";
			}

}
