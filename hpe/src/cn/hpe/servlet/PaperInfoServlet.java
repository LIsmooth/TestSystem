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

import cn.hpe.dao.QuestionDAOImp;
import cn.hpe.po.QuestionLimit;
import cn.hpe.po.Sections;
import cn.hpe.po.SubjectInfo;

@WebServlet(urlPatterns="/PaperInfoServlet")
public class PaperInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		
		String function=request.getParameter("function");
		//System.out.println("fun="+function);
		
		try{			
			if("0".equals(function))
				returnSubjectsid(request,response);
			else if("1".equals(function))
				setSections(request,response);
			else if("3".equals(function))
				response.sendRedirect("paperInfo.jsp");
			else if("4".equals(function))
				getQuestionNumByDegree(request,response);
			else if("5".equals(function))
				getQuestionNumBySection(request,response);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	private void getQuestionNumBySection(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int start=Integer.parseInt(request.getParameter("startSection"));
		int end=Integer.parseInt(request.getParameter("endSection"));
		//System.out.println(start+"**"+end);
		QuestionDAOImp qdi=new QuestionDAOImp();
		String num="";
		
		QuestionLimit ql=new QuestionLimit();
		
		ql.setQuestion_type("1");
		//ql.setLimit("");//清除question_type带来的影响，后期可以对所有题的类型都遍历一遍
		ql.setBegin_section(start);
		ql.setEnd_section(end);
		
		//System.out.println(ql.getLimit());
	
		num+=qdi.getCountQuestionBySubjectid(ql)+",";
		
		ql=new QuestionLimit();
		ql.setQuestion_type("3");
		ql.setBegin_section(start);
		ql.setEnd_section(end);
		num+=qdi.getCountQuestionBySubjectid(ql)+",";
		
		ql=new QuestionLimit();
		ql.setQuestion_type("4");
		ql.setBegin_section(start);
		ql.setEnd_section(end);
		num+=qdi.getCountQuestionBySubjectid(ql)+",";
		
		//System.out.println(num);
		
		PrintWriter out=response.getWriter();
		out.print(num);
	}

	private void getQuestionNumByDegree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String degree=request.getParameter("degree");
		String subjectid=request.getParameter("subjectid");
		String startsec=request.getParameter("beginsec");
		String endsec=request.getParameter("endsec");
		
		QuestionDAOImp qdi=new QuestionDAOImp();
		String num="";
		
		QuestionLimit ql=new QuestionLimit();
		if(startsec!=null) ql.setBegin_section(Integer.parseInt(startsec));
		if(endsec!=null) ql.setEnd_section(Integer.parseInt(endsec));
		if(degree!=null)ql.setLevel_type(degree);
		if(subjectid!=null)ql.setSubject_id(subjectid);
		
		String limit=ql.getLimit();
		
		ql.setQuestion_type("1");
		//ql.setLimit("");//清除question_type带来的影响，后期可以对所有题的类型都遍历一遍
		ql.setLimit(ql.getLimit()+limit);
		num+=qdi.getCountQuestionBySubjectid(ql)+",";
		
		ql=new QuestionLimit();
		ql.setQuestion_type("3");
		//ql.setLimit("");
		ql.setLimit(ql.getLimit()+limit);		
		num+=qdi.getCountQuestionBySubjectid(ql)+",";
		
		//System.out.println(limit);
		
		ql=new QuestionLimit();
		ql.setQuestion_type("4");
		//ql.setLimit("");
		ql.setLimit(ql.getLimit()+limit);
		num+=qdi.getCountQuestionBySubjectid(ql);
		
		PrintWriter out=response.getWriter();
		out.print(num);
	}

	private void setSections(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
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
