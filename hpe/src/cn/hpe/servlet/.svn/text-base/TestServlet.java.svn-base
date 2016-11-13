package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import cn.hpe.dao.TeacherDAO;
import cn.hpe.dao.TeacherDaoImpl;
import cn.hpe.po.ExamClass;
import cn.hpe.po.Student;

public class TestServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		TeacherDAO t=new TeacherDaoImpl();
		String examno=request.getParameter("examno");
		String classid=request.getParameter("classid");	
		String paperno=request.getParameter("paperno");
		ExamClass ec=new ExamClass();
		ec.setClassid(classid);
		ec.setExamNo(examno);
		ec.setPaperNo(paperno);
		List<Student> stuList=t.getStudent(Integer.parseInt(examno),Integer.parseInt(classid));
		int size=stuList.size();
		int remainder=size%2;
		int num=size/2+remainder;
		request.setAttribute("stuList",stuList);
		request.setAttribute("size", num);
		request.setAttribute("number",size);
		request.setAttribute("ecm", ec);
		if(num>0){
			request.getRequestDispatcher("paperClassRead.jsp").forward(request, response);
		}
		else {
			 
			PrintWriter out=response.getWriter();
		    out.write("<script>alert('没有人作答');</script>");
			request.getRequestDispatcher("paperReaderMessage.jsp").forward(request, response);
			//response.sendRedirect("paperReaderMessage.jsp");
		}
		}
		 		 
		
}