package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.MemberDAO;
import org.kosta.ShareCommaProject.model.MemberVO;

public class RegisterMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String nick = request.getParameter("nick");
		String status = request.getParameter("status");
		MemberVO mvo = new MemberVO(id,password,name,phone,nick,null,status);
		
		MemberDAO.getInstance().registerMember(mvo);
		
		request.setAttribute("url", "member/register-result.jsp");
		return "layout.jsp";
	}

}
