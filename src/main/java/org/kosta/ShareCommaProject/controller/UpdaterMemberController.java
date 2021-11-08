package org.kosta.ShareCommaProject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.MemberDAO;
import org.kosta.ShareCommaProject.model.MemberVO;

public class UpdaterMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("회원정보수정은 POST 방식만 허용됩니다.");
		
		HttpSession session=request.getSession(false);
		if(session == null||session.getAttribute("mvo") == null) { //로그인 상태가 아니면 index로 이동시킨다 
			return "redirect:HouseListController.do";
		}
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String nick = request.getParameter("nick");
		String status = request.getParameter("status");
		MemberVO mvo = new MemberVO(id,password,name,phone,nick,null,status);
		MemberDAO.getInstance().updateMember(mvo);
		session.setAttribute("mvo", mvo);
		
		return "redirect:HouseListController.do";
	}

}
