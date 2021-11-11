package org.kosta.ShareCommaProject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.MemberVO;
import org.kosta.ShareCommaProject.model.ReservationDAO;
import org.kosta.ShareCommaProject.model.ReservationVO;

public class ReservationListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null)
			return "redirect:HouseListController.do";
		
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
				
		
		ArrayList<ReservationVO>list=
		ReservationDAO.getInstance().getReservationList(mvo.getId());
		
		request.setAttribute("rlist", list);
		request.setAttribute("url", "board/reservation-status.jsp");
		return "layout.jsp";
	}

}
