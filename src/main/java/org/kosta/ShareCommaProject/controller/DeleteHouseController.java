package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.HouseBoardDAO;
import org.kosta.ShareCommaProject.model.MemberDAO;

public class DeleteHouseController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HouseBoardDAO.getInstance().deleteHouse(request.getParameter("hid"));
		System.out.println("하우스 게시물이 삭제되었습니다.");
		return "redirect:HouseListController.do";
	}

}
