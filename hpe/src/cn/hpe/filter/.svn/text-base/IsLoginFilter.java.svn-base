package cn.hpe.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.StudentDAO;
import cn.hpe.dao.StudentDAOImpl;

public class IsLoginFilter implements Filter {

	String resource = "";

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		if (session.getAttribute("sloginTime") == null) {
			arg2.doFilter(arg0, arg1);
		} else {
			long time = (long) session.getAttribute("sloginTime");

			String sno = (String) session.getAttribute("userid");
			StudentDAO s = new StudentDAOImpl();
			long timeInDB = s.getStudentLoginTime(sno);

			String uri = request.getRequestURI();
			String page = uri.substring(uri.lastIndexOf("/") + 1);
			// System.out.println("page=" + page);
			if (isExcludeResource(page) || isExcludeResource2(page)) {
				arg2.doFilter(arg0, arg1);
			} else {
				if (time != timeInDB) {
					session.invalidate();
					response.sendRedirect("login.jsp");
				} else {
					arg2.doFilter(arg0, arg1);
				}
			}
		}
	}

	public boolean isExcludeResource(String page) {

		String[] r = resource.split(";");

		for (String re : r) {
			if (re.equals(page)) {
				return true;
			}
		}
		return false;

	}

	public boolean isExcludeResource2(String page) {

		String[] r = resource.split(";");

		for (String re : r) {
			if (page.endsWith(re)) {
				return true;
			}
		}
		return false;

	}

	public void init(FilterConfig fc) throws ServletException {
		resource = fc.getInitParameter("excludeResource");

	}
}
