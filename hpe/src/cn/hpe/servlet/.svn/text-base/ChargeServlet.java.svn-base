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

 
public class ChargeServlet extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		 
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    response.setCharacterEncoding("utf-8");
		    String classid=request.getParameter("classid");
		    request.getSession().setAttribute("classid", classid);
		    int i;
		    String op1=request.getParameter("op1");
		    if("first".equals(op1)){
		    	 i=0;
		    }
		    else {
				 i=(int)request.getSession().getAttribute("i");
			}
			PaperDAOImp pdi=new PaperDAOImp();
			TeacherDaoImpl tdi=new TeacherDaoImpl();
			Integer no=Integer.parseInt(request.getParameter("paperno"));
			request.getSession().setAttribute("paperno", no);
			Integer examno=Integer.parseInt(request.getParameter("examno"));
			request.getSession().setAttribute("examno", examno);
			List<String> snoList=tdi.getSno(no,classid);
			String op=(String)request.getParameter("op");
			if("next".equals(op)){
				i+=1;
			}
			
 
				try {
					request.getSession().setAttribute("i", i);
					Paper paper=pdi.getPaper(no);
					if(snoList.size()!=0){
						if(i>=snoList.size()){
							response.sendRedirect("error.jsp");
							return;
						}
						 
					}
					if(tdi.flag(no, snoList.get(i))){
						List<Integer> getMarkList=tdi.getMark(no, snoList.get(i));
					    request.getSession().setAttribute("getMarkList", getMarkList);
					    
						request.getSession().setAttribute("charged", "0");
						 
					}
					else {
						List<Integer> getMarkList=new ArrayList<>();
						for(int j=0;j<=tdi.countQid(no, snoList.get(i));j++){
							getMarkList.add(0);
						}
						  request.getSession().setAttribute("getMarkList", getMarkList);
						  request.getSession().setAttribute("charged", "1");
						  
					}
					 
					List<String> answer=tdi.getAnswer(no, snoList.get(i));
					String sno=snoList.get(i);
					String sname=tdi.getSname(sno);
					request.getSession().setAttribute("sname", sname);
					request.getSession().setAttribute("sno", sno);
					int type1=pdi.getMark(no, 1);
					int type3=pdi.getMark(no, 3);
					int type4=pdi.getMark(no, 4);
					request.getSession().setAttribute("paper", paper);
					request.getSession().setAttribute("type1", type1);
					request.getSession().setAttribute("type3", type3);
					request.getSession().setAttribute("type4", type4);
					request.getSession().setAttribute("answer", answer);
					request.getSession().setAttribute("sum", 0);
					response.sendRedirect("charge.jsp");
				} catch (Exception e) {
 				    response.sendRedirect("wrong.jsp");
				}
			 
			
		}
		

}
