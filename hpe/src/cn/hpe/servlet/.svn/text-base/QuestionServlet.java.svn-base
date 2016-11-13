package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.QuestionDAO;
import cn.hpe.dao.QuestionDAOImp;
import cn.hpe.po.ClassInfo;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.PageBean;
import cn.hpe.po.QuestionLevel;
import cn.hpe.po.QuestionLimit;
import cn.hpe.po.QuestionType;
import cn.hpe.po.Sections;
import cn.hpe.po.SubjectInfo;
import cn.hpe.util.GetMessage;

public class QuestionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		getAllMessage(request, response);
		HttpSession session = request.getSession();
		String op = request.getParameter("op");
		if("ADD".equals(op)){
			
			String questionType=request.getParameter("questiontype");
			if("3".equals(questionType)||"4".equals(questionType)){
				addEssayQuestion(request,response);
			}
			if("1".equals(questionType)||"2".equals(questionType)){
				addMultiQuestion(request,response);
			}
		}
		if ("getQues".equals(op)) {
			QuestionLimit ql = new QuestionLimit();
			String subject = request.getParameter("subject");
			String questionType = request.getParameter("questionType");
			String levelType = request.getParameter("levelType");
			String endSection = request.getParameter("endSection");
			if (subject != null) {
				ql.setSubject_id(subject);
				ql.setQuestion_type(questionType);
				ql.setLevel_type(levelType);
				ql.setEnd_section(Integer.parseInt(endSection));
				session.setAttribute("LIMIT", ql);
			} else {
				if (session.getAttribute("LIMIT") == null) {
					ql.setSubject_id("0");
					ql.setQuestion_type("0");
					ql.setLevel_type("0");
					ql.setEnd_section(0);
					session.setAttribute("LIMIT", ql);
				}
			}
			getQuestion(request, response);
		}
		if("LOOK".equals(op)||"UPD".equals(op)){
			String questionType=request.getParameter("questiontype");
			if("3".equals(questionType)||"4".equals(questionType)){
				getEssayQuestionByQuestionNo(request,response,questionType);
			}
			if("1".equals(questionType)||"2".equals(questionType)){
				getMultiQuestionByQuestionNo(request,response,questionType);
			}
		}
		if("UPDQUES".equals(op)){
			String questionType=request.getParameter("questiontype");
			if("3".equals(questionType)||"4".equals(questionType)){
				updEssayQuestionByQuestionNo(request,response);
			}
			if("1".equals(questionType)||"2".equals(questionType)){
				updMultiQuestionByQuestionNo(request,response);
			}
		}
		if("DEL".equals(op)){
			String questionType=request.getParameter("questiontype");
			if("3".equals(questionType)||"4".equals(questionType)){
				delEssayQuestionByQuestionNo(request,response,questionType);
			}
			if("1".equals(questionType)||"2".equals(questionType)){
				delMultiQuestionByQuestionNo(request,response,questionType);
			}
		}
		if("FIND".equals(op)){
			findQuestionByQuestionTitle(request,response);
		}
		if("ToAddPage".equals(op)){
			response.sendRedirect("questionAdd.jsp");
		}
	}
	
	/**
	 * 根据questionTitle模糊查询
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	public void findQuestionByQuestionTitle(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		QuestionDAO qD = new QuestionDAOImp();
		HttpSession session = request.getSession();
		String question = request.getParameter("questionTitle");
		session.setAttribute("QUESTIONTITLE", question);
		Map<String,Object> questionMap = new HashMap<String,Object>();
		try {
			questionMap = qD.findQuestionByQuestion(question);
			if(!questionMap.isEmpty()){
				session.setAttribute("QUESTIONMAP", questionMap);
			}
			else{
				session.setAttribute("QUESTIONMAP", questionMap);
				session.setAttribute("NOFOUND", "没有找到相应结果");
			}
			response.sendRedirect("questionFindResult.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据questionno删除MultiQuestion
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void delMultiQuestionByQuestionNo(HttpServletRequest request,
			HttpServletResponse response, String questionType) throws ServletException, IOException {
		int questionno=Integer.parseInt(request.getParameter("questionno"));
		QuestionDAO qD = new QuestionDAOImp();
		HttpSession session=request.getSession();
		boolean isSuc=false;
		try {
			isSuc = qD.delQuestionByQuestionNo(questionno,questionType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(isSuc){
			session.setAttribute("MESSAGE", "删除成功");
			response.sendRedirect("questionShow.jsp");
		}
		else{
			session.setAttribute("MESSAGE", "删除失败");
			response.sendRedirect("questionShow.jsp");
		}
	}

	/**
	 * 根据questionno删除EssayQuestion
	 * @param request
	 * @param response
	 * @param questionType
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delEssayQuestionByQuestionNo(HttpServletRequest request,
			HttpServletResponse response, String questionType) throws ServletException, IOException {
		int questionno=Integer.parseInt(request.getParameter("questionno"));
		QuestionDAO qD = new QuestionDAOImp();
		HttpSession session=request.getSession();
		boolean isSuc=false;
		try {
			isSuc = qD.delQuestionByQuestionNo(questionno,questionType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(isSuc){
			session.setAttribute("MESSAGE", "删除成功");
			response.sendRedirect("questionShow.jsp");
		}
		else{
			session.setAttribute("MESSAGE", "删除失败");
			response.sendRedirect("questionShow.jsp");
		}
	}

	public void updMultiQuestionByQuestionNo(HttpServletRequest request,
			HttpServletResponse response) {
		MultiQuestion mq = new MultiQuestion();
		HttpSession session=request.getSession();
		int questionno=Integer.parseInt(request.getParameter("questionno"));
		mq=getMultiForm(request,response);
		mq.setQuestionno(questionno);
		String oldQuestionType=request.getParameter("oldQuestionType");
		QuestionDAO qD = new QuestionDAOImp();
		try {
			boolean isSuc=false;
			if("1".equals(oldQuestionType)||"2".equals(oldQuestionType)){
				isSuc=qD.addMultiQuestion(mq,false);
			}
			else{
				isSuc=qD.addMultiQuestion(mq,true);
			}
			if(isSuc){
				session.setAttribute("MESSAGE", "修改成功");
				response.sendRedirect("questionShow.jsp");
			}
			else{
				session.setAttribute("MESSAGE", "修改失败");
				response.sendRedirect("questionShow.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新问答题
	 * @param request
	 * @param response
	 */
	public void updEssayQuestionByQuestionNo(HttpServletRequest request,
			HttpServletResponse response) {
		EssayQuestion eq = new EssayQuestion();
		HttpSession session=request.getSession();
		int questionno=Integer.parseInt(request.getParameter("questionno"));
		eq=getEssayForm(request,response);
		eq.setQuestionno(questionno);
		String oldQuestionType=request.getParameter("oldQuestionType");
		QuestionDAO qD = new QuestionDAOImp();
		try {
			boolean isSuc=false;
			if("1".equals(oldQuestionType)||"2".equals(oldQuestionType)){
				isSuc=qD.addEssayQuestion(eq,true);
			}
			else{
				isSuc=qD.addEssayQuestion(eq,false);
			}
			if(isSuc){
				session.setAttribute("MESSAGE", "修改成功");
				response.sendRedirect("questionShow.jsp");
			}
			else{
				session.setAttribute("MESSAGE", "修改失败");
				response.sendRedirect("questionShow.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据questionno得到问答题
	 * @param request
	 * @param response
	 * @param questionType
	 */
	public void getEssayQuestionByQuestionNo(HttpServletRequest request,
			HttpServletResponse response,String questionType) {
		int questionno=Integer.parseInt(request.getParameter("questionno"));
		QuestionDAO qD = new QuestionDAOImp();
		HttpSession session=request.getSession();
		try {
			EssayQuestion eq=qD.getEssayQuestionByQuestionNo(questionno);
			session.setAttribute("ESSAYQUESTION", eq);
			response.sendRedirect("questionEssayUpdate.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据questionno得到选择题
	 * @param request
	 * @param response
	 * @param questionType
	 */
	public void getMultiQuestionByQuestionNo(HttpServletRequest request,
			HttpServletResponse response,String questionType) {
		int questionno=Integer.parseInt(request.getParameter("questionno"));
		QuestionDAO qD = new QuestionDAOImp();
		HttpSession session=request.getSession();
		try {
			MultiQuestion mq=qD.getMultiQuestionByQuestionNo(questionno);
			session.setAttribute("MULTIQUESTION", mq);
			response.sendRedirect("questionMultiUpdate.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 添加问答题
	 * @param request
	 * @param response
	 */
	public void addEssayQuestion(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		EssayQuestion eq = new EssayQuestion();
		HttpSession session=request.getSession();
		eq=getEssayForm(request,response);
		QuestionDAO qD = new QuestionDAOImp();
		try {
			boolean isSuc=qD.addEssayQuestion(eq,true);
			if(isSuc){
				session.setAttribute("MESSAGE", "添加成功");
				response.sendRedirect("questionShow.jsp");
			}
			else{
				session.setAttribute("MESSAGE", "添加失败");
				response.sendRedirect("questionShow.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 添加选择题
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException 
	 */
	public void addMultiQuestion(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		MultiQuestion mq = new MultiQuestion();
		mq=getMultiForm(request,response);
		HttpSession session=request.getSession();
		QuestionDAO qD = new QuestionDAOImp();
		try {
			boolean isSuc=qD.addMultiQuestion(mq,true);
			if(isSuc){
				session.setAttribute("MESSAGE", "添加成功");
				response.sendRedirect("questionShow.jsp");
			}
			else{
				session.setAttribute("MESSAGE", "添加失败");
				response.sendRedirect("questionShow.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 得到所有题目
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getQuestion(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		QuestionDAO qD = new QuestionDAOImp();
		HttpSession session = request.getSession();
		QuestionLimit ql = (QuestionLimit) session.getAttribute("LIMIT");
		PageBean pb1 = new PageBean();
		int currentPage = 0, totalSize = 0, totalPage = 0;
		int pageSize = pb1.getPerPageRows();
		try {
			totalSize = qD.getCountQuestion(ql);
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
		if (ql.getQuestion_type().equals("3")
				|| ql.getQuestion_type().equals("4")) {
			List<EssayQuestion> le = new ArrayList<EssayQuestion>();
			try {
				le = qD.getAllEssayQuestion(ql, num1, num2);
				pb1.setResult(le);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			List<MultiQuestion> lm = new ArrayList<MultiQuestion>();
			try {
				lm = qD.getAllMultiQuestion(ql, num1, num2);
				pb1.setResult(lm);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		session.setAttribute("PageBean1", pb1);
		response.sendRedirect("questionManage.jsp");
	}

	/**
	 * 得到全部课程名，章节数，题型，难度等级
	 */
	public void getAllMessage(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<SubjectInfo> ls = new ArrayList<SubjectInfo>();
		List<QuestionLevel> lql = new ArrayList<QuestionLevel>();
		List<Sections> lsec = new ArrayList<Sections>();
		List<QuestionType> lqt = new ArrayList<QuestionType>();
		List<ClassInfo> lci = new ArrayList<ClassInfo>();
		if (session.getAttribute("SUBJECTINFO") == null) {
			try {
				ls = GetMessage.getAllSubject();
				session.setAttribute("SUBJECTINFO", ls);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (session.getAttribute("QUESTIONINFO") == null) {
			try {
				lql = GetMessage.getAllLevel();
				session.setAttribute("QUESTIONINFO", lql);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (session.getAttribute("SECTIONS") == null) {
			try {
				lsec = GetMessage.getAllSection();
				session.setAttribute("SECTIONS", lsec);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (session.getAttribute("QUESTIONTYPE") == null) {
			try {
				lqt = GetMessage.getAllQuestionType();
				session.setAttribute("QUESTIONTYPE", lqt);
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
	
	
	/**
	 * 得到问答题表单信息
	 */
	public EssayQuestion getEssayForm(HttpServletRequest request,
			HttpServletResponse response) {
		EssayQuestion eq = new EssayQuestion();
		String subjectid=request.getParameter("subject");
		String sectionid=request.getParameter("endSection");
		String question=request.getParameter("subjectTitle");
		String questionlevel=request.getParameter("questionlevel");
		String questionmark=request.getParameter("questionmark");
		String ismultiple=request.getParameter("questiontype");
		String rightanswer=request.getParameter("essayRightanswer");
		
		eq.setSubjectid(subjectid);
		eq.setQuestion(question);
		eq.setQuestionlevel(Integer.parseInt(questionlevel));
		eq.setRightanswer(rightanswer);
		eq.setIsessay(Integer.parseInt(ismultiple));
		eq.setSectionid(Integer.parseInt(sectionid));
		eq.setQuestionmark(Integer.parseInt(questionmark));
		return eq;
	}
	/**
	 * 得到选择题表单信息
	 * @param request
	 * @param response
	 * @return
	 */
	public MultiQuestion getMultiForm(HttpServletRequest request,
			HttpServletResponse response) {
		MultiQuestion mq = new MultiQuestion();
		String subjectid=request.getParameter("subject");
		String sectionid=request.getParameter("endSection");
		String question=request.getParameter("subjectTitle");
		String questionA=request.getParameter("questionA");
		String questionB=request.getParameter("questionB");
		String questionC=request.getParameter("questionC");
		String questionD=request.getParameter("questionD");
		String questionlevel=request.getParameter("questionlevel");
		String questionmark=request.getParameter("questionmark");
		String ismultiple=request.getParameter("questiontype");
		String rightanswer="";
		if(ismultiple.equals("1")){
			rightanswer=request.getParameter("rightanswer");
		}
		else{
			String[] str=request.getParameterValues("rightanswer");
			for(String s:str){
				rightanswer+=s;
			}
		}
		mq.setSubjectid(subjectid);
		mq.setQuestion(question);
		mq.setQuestionA(questionA);
		mq.setQuestionB(questionB);
		mq.setQuestionC(questionC);
		mq.setQuestionD(questionD);
		mq.setQuestionlevel(Integer.parseInt(questionlevel));
		mq.setRightanswer(rightanswer);
		mq.setIsmultiple(Integer.parseInt(ismultiple));
		mq.setSectionid(Integer.parseInt(sectionid));
		mq.setQuestionmark(Integer.parseInt(questionmark));
		return mq;
	}
}
