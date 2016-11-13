package cn.hpe.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.ScoreDAO;
import cn.hpe.dao.ScoreDAOImp;
import cn.hpe.po.ClassInfo;
import cn.hpe.po.ClassScore;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.PageBean;
import cn.hpe.po.QuestionLimit;
import cn.hpe.po.ScoreInfo;
import cn.hpe.po.ScoreLimit;
import cn.hpe.po.SubjectInfo;
import cn.hpe.util.GetMessage;
import cn.hpe.util.OutPut;

public class ScoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	/**
	 * 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		QuestionServlet qs = new QuestionServlet();
		getAllMessage(request, response);
		HttpSession session = request.getSession();
		String op = request.getParameter("op");
		if("getScore".equals(op)){
			ScoreLimit sl = new ScoreLimit();
			String subjectId = request.getParameter("subject");
			String classId = request.getParameter("className");
			String order = request.getParameter("scoreOrder");
			if (subjectId != null) {
				sl.setSubjectId(subjectId);
				sl.setClassId(classId);
				sl.setOrder(order);
				session.setAttribute("SCORELIMIT", sl);
			} else {
				if (session.getAttribute("LIMIT") == null) {
					sl.setSubjectId("0");
					sl.setClassId("0");
					sl.setOrder("0");
					session.setAttribute("SCORELIMIT", sl);
				}
			}
			getAllScore(request, response);
		}
		if("LOOK".equals(op)){
			ScoreLimit sl = new ScoreLimit();
			String subjectId = request.getParameter("subjectid");
			String classId = request.getParameter("classid");
			if (subjectId != null) {
				sl.setSubjectId(subjectId);
				sl.setClassId(classId);
				session.setAttribute("CLASSSCORELIMIT", sl);
			}
			getClassScoreByClassId(request, response);
		}
		if("FIND".equals(op)){
			getScoreByStudentId(request, response);
		}
		if("OUTPUT".equals(op)){
			outPutClassScore(request, response);
		}
		if("toPtScoreManage".equals(op)){
			response.sendRedirect("setClassPtScore.jsp");
		}
		if("getPtScore".equals(op)){
			String subjectId=request.getParameter("subject");
			String classId=request.getParameter("className");
			getClassPtScoreByClassId(request, response,subjectId,classId);
		}
		if("setPtScore".equals(op)){
			setClassPtScoreByClassId(request, response);
		}
	}

	
	/**
	 * 设置班级平时成绩
	 * @param request
	 * @param response
	 */
	public void setClassPtScoreByClassId(HttpServletRequest request,
			HttpServletResponse response) {
		ScoreDAO sd = new ScoreDAOImp();
		HttpSession session = request.getSession();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		lcs=(List<ClassScore>)session.getAttribute("THISCLASSPTSCORE");
		for(int i = 0;i<lcs.size();i++){
			String str=request.getParameter(lcs.get(i).getSno());
			int ptScore=Integer.parseInt(str);
			lcs.get(i).setPtScore(ptScore);
		}
		boolean isSuc=false;
		try {
			isSuc=sd.setClassPtScore(lcs);
			if(isSuc){
				String subjectId=lcs.get(0).getSubjectId();
				String classId=lcs.get(0).getClassId();
				getClassPtScoreByClassId(request, response,subjectId,classId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 得到班级平时成绩
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getClassPtScoreByClassId(HttpServletRequest request,
			HttpServletResponse response,String subjectId,String classId) throws ServletException, IOException{
		ScoreDAO sd = new ScoreDAOImp();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		HttpSession session = request.getSession();
		try {
			lcs=sd.getClassPtScore(subjectId,classId);
			session.setAttribute("THISCLASSPTSCORE", lcs);
			response.sendRedirect("setClassPtScore.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出学生成绩
	 * @param request
	 * @param response
	 */
	public void outPutClassScore(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fileName=request.getParameter("filename");
		HttpSession session = request.getSession();
		PageBean pb = (PageBean)session.getAttribute("THISCLASSSCORE");
		List<ClassScore> lcs = (List<ClassScore>)pb.getResult();
		List<ClassInfo> lci = (List<ClassInfo>)session.getAttribute("CLASSINFO");
		List<SubjectInfo> ls = (List<SubjectInfo>)session.getAttribute("SUBJECTINFO");
		boolean isSuc=OutPut.writeData2CSV(lcs, fileName, lci, ls);
		if(isSuc){
			response.sendRedirect("classScoreShow.jsp");
		}
		else{
			response.sendRedirect("500.jsp");
		}
	}
	/**
	 * 根据学生ID查询该学生全部成绩信息
	 * @param request
	 * @param response
	 */
	public void getScoreByStudentId(HttpServletRequest request,
			HttpServletResponse response) {
		ScoreDAO sD = new ScoreDAOImp();
		HttpSession session = request.getSession();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		String studentId = request.getParameter("studentId"); 
		try {
			lcs=sD.getScoreByStudentId(studentId);
			if(lcs!=null){
				session.setAttribute("STUDENTSCORE", lcs);
				response.sendRedirect("studentScoreShow.jsp");
			}
			else{
				response.sendRedirect("scoreManage.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询某班级全体学生某科目成绩
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getClassScoreByClassId(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		ScoreDAO sD = new ScoreDAOImp();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		HttpSession session = request.getSession();
		PageBean pb1 = new PageBean();
		String examNo=request.getParameter("examNo");
		ScoreLimit sl = new ScoreLimit();
		int[] arr = new int[5];
		sl = (ScoreLimit) session.getAttribute("CLASSSCORELIMIT");
		int currentPage = 0, totalSize = 0, totalPage = 0;
		int pageSize = pb1.getPerPageRows();
		try {
			totalSize = sD.getCountClassScore(sl,examNo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String cpage = request.getParameter("cpage");
		if (cpage == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(cpage);
		}

		if (totalSize % pageSize == 0) {
			totalPage = totalSize / pageSize;
		} else {
			totalPage = totalSize / pageSize + 1;
		}

		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
		pb1.setCurrentPage(currentPage);
		pb1.setTotalPage(totalPage);
		pb1.setTotalSize(totalSize);
		int num1 = (currentPage - 1) * pageSize;
		int num2 = currentPage * pageSize;
		try {
			lcs = sD.getClassScoreByClassId(sl,examNo,num1,num2);
			pb1.setResult(lcs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			arr = sD.getTotalClassScore(sl,examNo);
			session.setAttribute("TOTALCLASSSCORE", arr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("THISCLASSSCORE", pb1);
		response.sendRedirect("classScoreShow.jsp");
	}

	/**
	 * 得到班级成绩总信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getAllScore(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ScoreDAO sD = new ScoreDAOImp();
		List<ScoreInfo> lsi = new ArrayList<ScoreInfo>();
		HttpSession session = request.getSession();
		ScoreLimit sl = new ScoreLimit();
		sl = (ScoreLimit)session.getAttribute("SCORELIMIT");
		try {
			lsi = sD.getClassScore(sl);
			if(lsi!=null){
				session.setAttribute("CLASSSCORE", lsi);
				response.sendRedirect("scoreManage.jsp");
			}
			else{
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 得到全部课程名,班级
	 */
	public void getAllMessage(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<SubjectInfo> ls = new ArrayList<SubjectInfo>();
		List<ClassInfo> lci = new ArrayList<ClassInfo>();
		if (session.getAttribute("SUBJECTINFO") == null) {
			try {
				ls = GetMessage.getAllSubject();
				session.setAttribute("SUBJECTINFO", ls);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (session.getAttribute("CLASSINFO") == null) {
			try {
				lci = GetMessage.getAllClssInfo();
				session.setAttribute("CLASSINFO", lci);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
