package org.kosta.ShareCommaProject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.HouseBoardDAO;
import org.kosta.ShareCommaProject.model.HouseVO;

public class HouseListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<HouseVO>list = HouseBoardDAO.getInstance().getHouseList();
		request.setAttribute("list", list);
		
		request.setAttribute("url", "board/list.jsp");
		return "layout.jsp";
	}

}
