package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hpe.dao.TeacherDaoImpl;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;

public class SumServlet extends HttpServlet {

 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer sum=0;
		int j=0;
		TeacherDaoImpl tdi=new TeacherDaoImpl();
		Paper paper=(Paper)request.getSession().getAttribute("paper");
		int paperno=(int)request.getSession().getAttribute("paperno");
		int type1=(int)request.getSession().getAttribute("type1");
		int examno=(int)(request.getSession().getAttribute("examno"));
		String sno=(String)request.getSession().getAttribute("sno");
		
		int qid=(int)request.getSession().getAttribute("qid");
		String[] wenda=request.getParameterValues("wenda");
		String[] biancheng=request.getParameterValues("biancheng");
		List<?> answer=(List<?>)request.getSession().getAttribute("answer");
		List<Integer> markList=new ArrayList<>();
		Integer var;
		if(wenda!=null){
			for(String w:wenda){
				var=Integer.parseInt(w);
				markList.add(var);
				sum+=(Integer.parseInt(w));
			}
		}
		if(biancheng!=null){
			for(String b:biancheng){
				var=Integer.parseInt(b);
				markList.add(var);
				sum+=(Integer.parseInt(b));
			}
		}
		 
		
		
		for(int i=0;i<markList.size();i++){
			int id=qid+1+i;
			tdi.setMark(paperno, sno, id, markList.get(i));
		}
		for(int i=0;i<paper.getMultiList().size();i++){
			 
			if(paper.getMultiList().get(i).getRightanswer().equals(answer.get(i))){
				tdi.setMark(paperno, sno, i+1, type1);
				j++;
			}
			else {
				tdi.setMark(paperno, sno, i+1, 0);
			}
		}
		tdi.charged(paperno, sno);
		sum+=j*type1;
		
		
		List<Integer> getMarkList=tdi.getMark(paperno, sno);
		request.getSession().setAttribute("getMarkList", getMarkList);
		 
		 
		tdi.getScore(examno, sno, sum);
		int fscore=tdi.getFinal(examno, sno);
		request.getSession().setAttribute("fscore", fscore);
		request.getSession().setAttribute("sum", sum);
		response.sendRedirect("charge.jsp");
		 
		
	}

 
}
