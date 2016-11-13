package cn.hpe.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	String resource = "";
	String tsource = "";
	String ssource="";

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain fchain) throws IOException, ServletException {

		HttpServletRequest hrequest = (HttpServletRequest) request;

		HttpServletResponse hresponse = (HttpServletResponse) response;

		HttpSession session = hrequest.getSession();

		Object objTeacher = session.getAttribute("username");
		Object objStudent = session.getAttribute("userid");
		Object objType=session.getAttribute("roles");

		//System.out.println(objTeacher + "\t" + objStudent);

		// 访问图片、css等资源
		String uri = hrequest.getRequestURI();
		String page = uri.substring(uri.lastIndexOf("/") + 1);
		if (isExcludeResource(page,resource)) {
			fchain.doFilter(request, response);// 调用目标资源
		}else if(objStudent!=null&&objType=="Student"&&isExcludeResource(page,ssource)){
			fchain.doFilter(request, response);// 调用目标资源
		}else if(objTeacher!=null&&objType=="Teacher"){
			fchain.doFilter(request, response);// 调用目标资源
		}else{
			session.invalidate();
			//System.out.println("page=" + page);
			hresponse.setCharacterEncoding("utf-8");
			hresponse.setContentType("text/html;charset=utf-8");
			PrintWriter out = hresponse.getWriter();
			out.print("<script>top.window.location.href='login.jsp';</script>");
			return;
		}

	}

	public boolean isExcludeResource(String page,String source) {

		String[] r = source.split(";");

		for (String re : r) {
			if (page.endsWith(re)) {
				return true;
			}
		}
		return false;

	}

	public void init(FilterConfig fc) throws ServletException {
		resource = fc.getInitParameter("excludeResource");
		tsource=fc.getInitParameter("teacherPages");
		ssource=fc.getInitParameter("studentPages");
		
	}

}
