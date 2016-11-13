package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hpe.dao.StudentDAO;
import cn.hpe.dao.StudentDAOImpl;
import cn.hpe.dao.TeacherDaoImpl;

@WebServlet(urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String role = request.getParameter("role");
		request.getSession().setAttribute("role", role);
		TeacherDaoImpl tdi = new TeacherDaoImpl();
		if ("teacher".equals(role)) {
			String name=tdi.findName(username);
			request.getSession().setAttribute("username", name);
			request.getSession().setAttribute("userid",username);
			request.getSession().setAttribute("roles", "Teacher");
			if (username != null && pwd != null) {
				if (tdi.login(username, pwd)) {
					out.print("成功了");
				} else {
					out.print("失败了");
				}
				out.close();

			}
		}
		 
		if ("student".equals(role)) {
			if (username != null && pwd != null) {
				StudentDAOImpl sdi=new StudentDAOImpl();
				if (sdi.login(username, pwd)) {
					out.print("成功了");		
					request.getSession().setAttribute("userid", username);
					request.getSession().setAttribute("roles", "Student");
				} else {
					out.print("失败了");
				}
				out.close();

			}
		}
		 
				
	}
}
