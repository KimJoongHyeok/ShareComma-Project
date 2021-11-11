package org.kosta.ShareCommaProject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.HouseBoardDAO;
 
public class UpdateHouseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("게시글 삭제는 post 방식만 허용됩니다");
		
		//houseID로 검색
		//차후 수정사항 
		String id=request.getParameter("hid");
		request.setAttribute("hvo", HouseBoardDAO.getInstance().getHouseById(request.getParameter("id")));
		
		request.setAttribute("url", "board/update-house-form.jsp");
		return "layout.jsp";
		 
	}

}
