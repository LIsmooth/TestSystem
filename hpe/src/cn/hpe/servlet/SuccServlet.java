package cn.hpe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hpe.dao.StudentDAO;
import cn.hpe.dao.StudentDAOImpl;

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
			StudentDAO sd=new StudentDAOImpl();
			long loginTime=System.currentTimeMillis();
			int r=sd.setStudentLoginTime(username, loginTime);
			request.getSession().setAttribute("sloginTime",loginTime);
			
			response.sendRedirect("StudentServlet?op=index&userid="+username);
		}

		 
	}

	 
}
