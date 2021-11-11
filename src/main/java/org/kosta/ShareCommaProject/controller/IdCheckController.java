package org.kosta.ShareCommaProject.controller;


import javax.activity.ActivityRequiredException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.MemberDAO;


public class IdCheckController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id"); //입력한 id값
		//String isCheck = request.getParameter("flag"); //flag == null;
		boolean idCheck = MemberDAO.getInstance().checkId(id);
		String info = null;
		if(idCheck) {//중복되는 아이디 존재.
			 info = "아이디가 중복됨!"; 
			// isCheck = null ;
		}else {
			 info = "사용가능한 아이디입니다.";
			 //isCheck = id;
		}
	//request.setAttribute("isCheck", isCheck);
	request.setAttribute("responsebody", info);
	return "AjaxView";
	}
}
