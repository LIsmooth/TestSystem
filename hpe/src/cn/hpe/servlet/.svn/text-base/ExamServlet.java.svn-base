package cn.hpe.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.ExamDAO;
import cn.hpe.dao.ExamDAOImp;
import cn.hpe.po.ClassInfo;
import cn.hpe.po.ExamClass;
import cn.hpe.po.PageBean;
import cn.hpe.po.PaperManage;
import cn.hpe.po.SubjectInfo;
import cn.hpe.util.GetMessage;

public class ExamServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String op = request.getParameter("op");
		getAllMessage(request, response);
		if("EXAMPUBLISH".equals(op)){
			response.sendRedirect("paperPublish.jsp");
		}
		if("PUB".equals(op)){
			addExamMessage(request, response);
		}
		if("READ".equals(op)){
			getExamMessage(request, response);
		}
		if("getCLASSMES".equals(op)){
			getExamClassMessage(request, response);
		}
		if("beginExam".equals(op)){
			beginExam(request, response);
		}
		if("endExam".equals(op)){
			endExam(request, response);
		}
	}

	public void endExam(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String examNo=request.getParameter("examNo");
		ServletContext application = request.getServletContext();
		application.removeAttribute("exam"+examNo);
		ExamDAO ed = new ExamDAOImp();
		boolean isSuc=false;
		try {
			isSuc = ed.setEndExam(examNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(isSuc){
			getExamMessage(request, response);
		}
		else{
			response.sendRedirect("404.jsp");
		}
	}


	/**
	 * 设置考试状态为1:开始考试
	 * @param request
	 * @param response
	 */
	public void beginExam(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String examNo=request.getParameter("examNo");
		ServletContext application = request.getServletContext();
		long ExamBeginTime = System.currentTimeMillis();
		application.setAttribute("exam"+examNo, ExamBeginTime);
		ExamDAO ed = new ExamDAOImp();
		boolean isSuc=false;
		try {
			isSuc = ed.setBaginExam(examNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(isSuc){
			getExamMessage(request, response);
		}
		else{
			response.sendRedirect("404.jsp");
		}
	}


	/**
	 * 得到考试班级信息
	 * @param request
	 * @param response
	 */
	public void getExamClassMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{	
		ExamDAO ed = new ExamDAOImp();
		HttpSession session = request.getSession();
		List<ExamClass> lec = new ArrayList<ExamClass>();
		String examNo=request.getParameter("examNo");
		String examName=request.getParameter("examName");
		String paperNo=request.getParameter("paperNo");
		String[] classids=request.getParameter("classids").split(",");
		for(int i =0;i<classids.length;i++){
			ExamClass ec=new ExamClass();
			ec.setExamNo(examNo);
			ec.setClassid(classids[i]);
			ec.setExamName(examName);
			ec.setPaperNo(paperNo);
			lec.add(ec);
		}
		try {
			lec = ed.getExamEveryClassMessage(lec);
			session.setAttribute("EXAMCLASSMESSAGE", lec);
			response.sendRedirect("paperReaderMessage.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * 得到所有考试信息
	 * @param request
	 * @param response
	 */
	public void getExamMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<PaperManage> lpm = new ArrayList<PaperManage>();
		ExamDAO ed = new ExamDAOImp();
		HttpSession session = request.getSession();
		PageBean pb1 = new PageBean();
		int currentPage = 0, totalSize = 0, totalPage = 0;
		int pageSize = pb1.getPerPageRows();
		try {
			totalSize = ed.getCountExam();
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
			lpm=ed.getAllExamMessage(num1,num2);
			pb1.setResult(lpm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("EXAMMESSAGE", pb1);
		response.sendRedirect("paperReader.jsp");
	}


	/**
	 * 添加考试信息到数据库
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addExamMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		PaperManage pm = new PaperManage();
		HttpSession session = request.getSession();
		ExamDAO ed = new ExamDAOImp();
		boolean isSuc = false;
		String subjectId=request.getParameter("subject");
		String paperId=request.getParameter("paperId");
		String classId="";
		String totalTime=request.getParameter("totalTime");
		String examTime=request.getParameter("examTime");
		examTime=examTime.replace('T', ' ');
		String[] str=request.getParameterValues("className");
		for(String s:str){
			classId+=s;
			classId+=",";
		}
		pm.setSubjectId(subjectId);
		pm.setPaperNo(paperId);
		pm.setClassList(classId);
		pm.setExamTime(examTime);
		pm.setTotalTime(totalTime);
		try {
			isSuc=ed.findPaper(pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(isSuc){
			try {
				pm=ed.updExamMessage(pm);
				ed.addExamMessage(pm);
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("ERRORMESSAGE", "试卷发布成功");
			response.sendRedirect("examShow.jsp");
		}
	}


	public void getAllExamMessage(HttpServletRequest request,
			HttpServletResponse response) {
		List<PaperManage> lpm = new ArrayList<PaperManage>();
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
