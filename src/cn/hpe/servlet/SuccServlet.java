package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SuccServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

		 
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String role=(String)request.getSession().getAttribute("role");
		if("teacher".equals(role)){
			response.sendRedirect("main.jsp");
		}
		if("student".equals(role)){
			response.sendRedirect("StudentServlet?op=index&userid="+username);
		}

		 
	}

	 
}
