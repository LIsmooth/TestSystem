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
	 * ѧ��������
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
	 * ѧ���޸�����
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 * ֻ��һ����ת
	 */
	public void changePwd(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{		
		response.sendRedirect("studentChangePwd.jsp");				
	}
	
	/**
	 * ѧ���޸������ʵ��
	 * @param request
	 * @param response
	 * @param userid
	 * @throws ServletException
	 * @throws IOException
	 */
	public void change(HttpServletRequest request,HttpServletResponse response,
			String userid)throws ServletException, IOException{	
		int r=0;
		//��ȡҳ����������
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
			System.out.println("�޸�����ɹ�");
			response.sendRedirect("StudentServlet?op=index");
		}
		
		
	}
	
	
	/**
	 * ����session���˳���¼��������ҳ��
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
	 * ��ʼ����
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
	 * ѧ���鿴��ʷ�ɼ�
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
