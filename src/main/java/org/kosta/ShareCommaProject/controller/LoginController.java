package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.MemberDAO;
import org.kosta.ShareCommaProject.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberVO mvo = MemberDAO.getInstance().login(id,password);
		if(mvo==null) {
			return "redirect:member/login-fail.jsp";
		}else {
			HttpSession session = request.getSession();
			//로그인 인증 정보 할당
			session.setAttribute("mvo", mvo);
			return "redirect:HouseListController.do";
		}
	}

}
