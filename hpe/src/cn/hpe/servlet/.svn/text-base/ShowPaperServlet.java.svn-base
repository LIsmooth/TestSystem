package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hpe.dao.PaperDAOImp;
import cn.hpe.dao.TeacherDaoImpl;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;

 
public class ShowPaperServlet extends HttpServlet {

	 
	PaperDAOImp pdi=new PaperDAOImp();
	TeacherDaoImpl tdi=new TeacherDaoImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		 
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    response.setCharacterEncoding("utf-8");
			Integer no=Integer.parseInt(request.getParameter("paperno"));
			String Sno=request.getParameter("sno");
				try {
					Paper paper=pdi.getPaper(no);
					List<String> answer=tdi.getAnswer(no,Sno);
					int type1=pdi.getMark(no, 1);
					int type3=pdi.getMark(no, 3);
					int type4=pdi.getMark(no, 4);
					request.getSession().setAttribute("paper", paper);
					request.getSession().setAttribute("type1", type1);
					request.getSession().setAttribute("type3", type3);
					request.getSession().setAttribute("type4", type4);
					request.getSession().setAttribute("answer", answer);
					 
					response.sendRedirect("showPaper.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			 
			
		}
		

}
