package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.MemberDAO;

public class DeleteMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberDAO.getInstance().deleteMember(request.getParameter("id"));
		
		return "redirect:HouseListController.do";
	}

}
