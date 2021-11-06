package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateMemberFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setAttribute("url", "member/update-member-form.jsp");
		return "layout.jsp";
	}

}
