package org.kosta.ShareCommaProject.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.MemberDAO;
import org.kosta.ShareCommaProject.model.MemberVO;

public class BecomeHostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		MemberDAO.getInstance().becomeHost(request.getParameter("id"));
		MemberVO mvo = MemberDAO.getInstance().getMemberById(request.getParameter("id"));
		request.getSession().setAttribute("mvo", mvo);
		return "redirect:HouseListController.do";
	}
}
