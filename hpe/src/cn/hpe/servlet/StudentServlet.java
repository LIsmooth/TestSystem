package cn.hpe.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.PaperDAO;
import cn.hpe.dao.PaperDAOImp;
import cn.hpe.dao.StudentDAO;
import cn.hpe.dao.StudentDAOImpl;
import cn.hpe.po.Answer;
import cn.hpe.po.ClassInfo;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;
import cn.hpe.po.PaperManage;
import cn.hpe.po.Score;
import cn.hpe.po.Student;
import cn.hpe.po.SubjectInfo;
import cn.hpe.util.GetMessage;

public class StudentServlet extends HttpServlet {
	
	
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
	    
		HttpSession session = request.getSession();
		String userid=(String)session.getAttribute("userid");//把sno放进session
		
		String op=request.getParameter("op");//获取op用于判断

		if(op.equals("index")){
			index(request,response,userid);
		}
		if(op.equals("changepwd")){
			changePwd(request,response,userid);
		}
		if(op.equals("change")){
			change(request,response,userid);
		}
		if(op.equals("exit")){
			exit(request,response,userid);
		}if(op.equals("begin")){
			begin(request,response,userid);
		}
		if(op.equals("showhistory")){
			showHistory(request,response,userid);
		}		
		if(op.equals("beginexam")){
			beginexam(request,response,userid);
		}
		if(op.equals("answersubmit")){
			answersubmit(request,response,userid);
		}
		if(op.equals("wait")){
			waitExam(request,response,userid);
		}
	}
	
	
	/**
	 * 学生主界面
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void index(HttpServletRequest request, HttpServletResponse response,
		String userid) throws ServletException, IOException{
		
		getAllMessage(request,response);
		StudentDAO sd=new StudentDAOImpl();
		Student student=new Student();
		student.setSno(userid);
		student=sd.getStudentInfo(student);
		HttpSession session = request.getSession();
		session.setAttribute("student", student);
		response.sendRedirect("studentIndex.jsp");	
	}
	
	/**
	 * 学生修改密码
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 * 只是一个跳转
	 */
	public void changePwd(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{		
		response.sendRedirect("studentChangePwd.jsp");				
	}
	
	/**
	 * 学生修改密码的实现
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void change(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{	
		int r=0;
		HttpSession session = request.getSession();
		//获取页面输入密码
		String pwd1=request.getParameter("pwd1");
		
		StudentDAO sd=new StudentDAOImpl();
		Student s1=new Student();
		s1.setSno(userid);
		Student ss=sd.getStudentInfo(s1);
		ss.setSpwd(pwd1);
		r=sd.updateStudentPwd(ss);
		if(r>0){
			session.setAttribute("STUMESSAGE", "密码修改成功");
			response.sendRedirect("studentShow.jsp");
		}
		else{
			session.setAttribute("STUMESSAGE", "密码修改失败");
			response.sendRedirect("studentShow.jsp");
		}
		
		
		
	}
	
	
	/**
	 * 清理session，退出登录，返回主页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void exit(HttpServletRequest request, HttpServletResponse response,
			String userid) throws ServletException, IOException{
	    request.getSession().invalidate();
		response.sendRedirect("login.jsp");
	}
		
	
	/**
	 * 开始考试，显示考试信息
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void begin(HttpServletRequest request, HttpServletResponse response,
			String userid) throws ServletException, IOException{	
		List<PaperManage> lpm=new ArrayList<PaperManage>();
		StudentDAO sd=new StudentDAOImpl();
		lpm=sd.getExamInfo(userid);
		
		Date d=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");	
		
		HttpSession session = request.getSession();
		session.setAttribute("examlist", lpm);
		session.setAttribute("NOWDATE", sf.format(d));
		response.sendRedirect("studentBegin.jsp");
	}
	
	
	/**
	 * 学生查看历史成绩
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showHistory(HttpServletRequest request, HttpServletResponse response,
			String userid) throws ServletException, IOException{
		List<Score> ls=new ArrayList<Score>();
		StudentDAO sd=new StudentDAOImpl();
		ls=sd.getScore(userid);
		HttpSession session = request.getSession();
		session.setAttribute("scorelist", ls);
		response.sendRedirect("studentShowHistory.jsp");		
	}
	
	/**
	 * 开始考试，进入考试页面，读取试题，放进session
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void beginexam(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		
		String paperNo=request.getParameter("paperno");
		Paper p=new Paper();
		PaperDAO pd=new PaperDAOImp();		
		try {
			p=pd.getPaper(Integer.parseInt(paperNo));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//long exambeginsec=System.currentTimeMillis()/1000;
		String examNo=request.getParameter("examNo");
		ServletContext application = request.getServletContext();
		long exambeginsec=(long)application.getAttribute("exam"+examNo)/1000;
		
		
		HttpSession session = request.getSession();
		session.setAttribute("p", p);
		session.setAttribute("exambeginsec", exambeginsec);

		//PrintWriter out =response.getWriter();
		//out.print("<script>window.open('studentBeginExam.jsp','','menubar=no,scrollbars=no,resizable=no,location=no,status=no')</script>");
		
		response.sendRedirect("studentBeginExam.jsp");		
	}
	
	
	
	/**
	 * 学生提交答案进入此方法
	 * 获取考试页面提交信息
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void answersubmit(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{	
		StudentDAO sd=new StudentDAOImpl();
		
	    Answer aw=new Answer();
	    int paperno=Integer.parseInt(request.getParameter("paperno"));
	    aw.setPaperNo(paperno);
	    aw.setSno(userid);
	    Map<String,String> map = new HashMap<String,String>();
	   
		HttpSession session = request.getSession();//获取session里的p
		Paper paper=(Paper)session.getAttribute("p");
		for(MultiQuestion a:paper.getMultiList()){
			String studentAnswer="";
			if(a.getIsmultiple()==1){
				if(request.getParameter(""+a.getInpaperno())!=null){
					studentAnswer=request.getParameter(""+a.getInpaperno());
				}
			    map.put(""+a.getInpaperno(), studentAnswer);
			}
			if(a.getIsmultiple()==2){
				if(request.getParameter(""+a.getInpaperno())!=null){
					String[] str=request.getParameterValues(""+a.getInpaperno());				
					for(String s:str){					
						studentAnswer+=s;
					}
				}
				 map.put(""+a.getInpaperno(), studentAnswer);				
			}			
		}
		for(EssayQuestion b:paper.getEssayList()){
			String essayAnswer="";			
			    if(request.getParameter("essay"+b.getInpaperno())!=null){
				    essayAnswer=request.getParameter("essay"+b.getInpaperno());
			    }
			    map.put(""+b.getInpaperno(), essayAnswer);			
				
		}
		aw.setStudentanswer(map);
		
		int isSuc=sd.insertStudentAnswer(aw);
		if(isSuc>0){
			session.setAttribute("STUMESSAGE", "交卷成功");
			response.sendRedirect("studentShow.jsp");
		}
		else{
			//提交错误時还要能找到原來的答案
			session.setAttribute("STUMESSAGE", "交卷失败");
			response.sendRedirect("studentShow.jsp");
			
			
		}
		
	}
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
	
	public void waitExam(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{		
		String paperno=request.getParameter("paperno");
		String totaltime=request.getParameter("totaltime");
		String examno=request.getParameter("examno");		
		HttpSession session = request.getSession();
		session.setAttribute("suPaperno", paperno);
		session.setAttribute("suTotaltime", totaltime);
		session.setAttribute("suExamno", examno);
		response.sendRedirect("studentWaitExam.jsp");	
		
		
	}
}
