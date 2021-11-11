package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.ShareCommaProject.model.HouseBoardDAO;
import org.kosta.ShareCommaProject.model.HouseVO;

public class HouseDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String houseId=request.getParameter("houseId");
		String img = request.getParameter("img");
		HouseVO hvo = HouseBoardDAO.getInstance().getHouseById(houseId);
		request.setAttribute("hvo", hvo);
		request.setAttribute("img", img);
		request.setAttribute("url", "board/house-detail.jsp");
		return "layout.jsp";
	}

}
