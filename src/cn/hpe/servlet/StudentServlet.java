package cn.hpe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.StudentDAO;
import cn.hpe.dao.StudentDAOImpl;
import cn.hpe.po.Paper;
import cn.hpe.po.Student;

public class StudentServlet extends HttpServlet {
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		HttpSession session = request.getSession();
		String userid=(String)session.getAttribute("userid");
		String op=request.getParameter("op");
		
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
			exit(request,response);
		}
		if(op.equals("begin")){
			begin(request,response,userid);
		}
		if(op.equals("showhistory")){
			showHistory(request,response,userid);
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
		//获取页面输入密码
		String pwd=request.getParameter("pwd");
		String pwd1=request.getParameter("pwd1");
		String pwd2=request.getParameter("pwd2");
			
		StudentDAO sd=new StudentDAOImpl();
		Student s1=new Student();
		s1.setSno(userid);
		Student ss=sd.getStudentInfo(s1);
		if(ss.getSpwd().equals(pwd)&&(pwd1.equals(pwd2))){
			ss.setSpwd(pwd1);
			r=sd.updateStudentPwd(ss);
		}else{
			response.sendRedirect("StudentServlet?op=changepwd");		
		}
		if(r>0){
			System.out.println("修改密码成功");
			response.sendRedirect("StudentServlet?op=index");
		}
		
		
	}
	
	
	/**
	 * 清理session，退出登录，返回主页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void exit(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException{
		request.getSession().removeAttribute("userid");
		response.sendRedirect("login.jsp");
	}
	
	
		
	
	/**
	 * 开始考试
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void begin(HttpServletRequest request, HttpServletResponse response,
			String userid) throws ServletException, IOException{
		Paper paper=new Paper();
		
		
		
		
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
		response.sendRedirect("studentShowHistory.jsp");
		
	}
	
	
	
	
	
}
