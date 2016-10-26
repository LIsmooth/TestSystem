package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hpe.po.Sections;
import cn.hpe.po.SubjectInfo;

@WebServlet(urlPatterns="/PaperInfoServlet")
public class PaperInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String function=request.getParameter("function");
		try{
			
			if("0".equals(function))
				returnSubjectsid(request,response);
			else if("1".equals(function))
				setSections(request,response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	private void setSections(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		PrintWriter out = response.getWriter();
		
		String subjectID=request.getParameter("subjectid");
		
		List<Sections> subList=cn.hpe.util.GetMessage.getSectionBySubjectID(subjectID);
		StringBuffer sb=new StringBuffer();
		sb.append("[");
		for(Sections s:subList){
			sb.append("{\"value\":\""+s.getSectionId()+"\",\"name\":\""+s.getSectionName()+"\"},");
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		out.print(sb);
		out.close();
	}

	private void returnSubjectsid(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		PrintWriter out = response.getWriter();
		
		List<SubjectInfo> subList=cn.hpe.util.GetMessage.getAllSubject();
		StringBuffer sb=new StringBuffer();
		sb.append("[");
		for(SubjectInfo s:subList){
			sb.append("{\"value\":\""+s.getSubjectId()+"\",\"name\":\""+s.getSubjectName()+"\"},");
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		out.print(sb);
		out.close();
	}

}
