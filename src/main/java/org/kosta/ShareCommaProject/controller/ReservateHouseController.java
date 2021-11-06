package org.kosta.ShareCommaProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.ShareCommaProject.model.HouseVO;
import org.kosta.ShareCommaProject.model.MemberVO;
import org.kosta.ShareCommaProject.model.ReservationDAO;
import org.kosta.ShareCommaProject.model.ReservationVO;

public class ReservateHouseController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		if(session == null||session.getAttribute("mvo") == null) { //로그인 상태가 아니면 index로 이동시킨다 
			return "redirect:HouseListController.do";
		}
		MemberVO mvo=(MemberVO)session.getAttribute("mvo");
//		HouseVO hvo=(HouseVO)request.getAttribute("hvo");
		String hid=request.getParameter("hid");
		System.out.println("RHC도착"+hid);
		HouseVO hvo=new HouseVO(hid,null,null,null,null,null,null,null);
		System.out.println(request.getParameter("hid"));
		int count=	Integer.parseInt(request.getParameter("count"));
		ReservationVO rvo=new ReservationVO(request.getParameter("checkIn"),request.getParameter("checkOut"),count,null,mvo,hvo);
		ReservationDAO.getInstance().reservateHouse(rvo);		
		request.setAttribute("url", "board/reservation-ok.jsp");
		return "layout.jsp";
	}

}
