package org.kosta.ShareCommaProject.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.MemberDAO;


public class IdCheckController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		boolean idCheck = MemberDAO.getInstance().checkId(id);
		String info = null;
		if(idCheck) {//중복되는 아이디 존재.
			 info = "아이디가 중복됨!"; 
		}else {
			 info = "아이디가 중복되지 않았습니다. 사용가능합니다.";
		}
	request.setAttribute("responsebody", info);
	return "AjaxView";
	}
}
