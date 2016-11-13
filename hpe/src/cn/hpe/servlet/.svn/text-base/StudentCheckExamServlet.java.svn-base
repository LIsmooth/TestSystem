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
@WebServlet(urlPatterns="/StudentCheckExamServlet")
public class StudentCheckExamServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		StudentDAO sd=new StudentDAOImpl();
		int examno=Integer.parseInt(request.getParameter("examno"));
		int status=sd.studentExamStatus(examno);
		if(status==0){
			out.print("考试未开始");
		}else if(status==1){
			out.print("可以开始考试");
		}else if(status==2){
			out.print("考试已结束");
		}
	    out.close();
	}

}
