package org.kosta.ShareCommaProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doDispatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		String uri=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=uri.substring(contextPath.length()+1, uri.length()-3);//Controller class명만 추출 : FindMemberByIdController
		Controller controller=HandlerMapping.getInstance().create(command);
		String path=controller.execute(request, response);
		if(path.startsWith("redirect:")) {
			response.sendRedirect(path.substring(9));
		}else {
			request.getRequestDispatcher(path).forward(request, response);
		}
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doDispatch(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.doDispatch(request, response);
	}

}








