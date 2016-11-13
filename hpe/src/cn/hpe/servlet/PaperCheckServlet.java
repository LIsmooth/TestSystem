package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.PaperDAOImp;
import cn.hpe.po.PageBean;
import cn.hpe.po.Paper;
import cn.hpe.po.PaperLimit;
import cn.hpe.service.PaperService;
@WebServlet(urlPatterns="/PaperCheckServlet")
public class PaperCheckServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		String function=request.getParameter("function");
		try{
		if("1".equals(function)||function==null) {
			PaperLimit pl=new PaperLimit();
			
			String limit=request.getParameter("limit");
			if(limit!=null)
				pl.setLimit(limit);
			
			pl.setSubject_id(request.getParameter("subjectid"));
				checkOnPage(request,response,pl);
		}
		else if("2".equals(function)) editPaper(request,response);
	
		else if("3".equals(function)) deletePaper(request,response);
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void deletePaper(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		out.print(true);
		PaperDAOImp pdi=new PaperDAOImp();
		int paperno=Integer.parseInt(request.getParameter("paperno"));
		pdi.deletePaperByNo(paperno);
		
	}

	public void checkOnPage(HttpServletRequest request, HttpServletResponse response, PaperLimit pl) throws Exception{
			
		PageBean pb1 = new PageBean();
		//分页测试用
//		pb1.setPerPageRows(1);
		
		PaperDAOImp pdi=new PaperDAOImp();
		int currentPage = 0, totalSize = 0, totalPage = 0;
		int pageSize = pb1.getPerPageRows();
		
		try {
			totalSize =pdi.getPaperNum(pl);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		String cpage = request.getParameter("currentPage");
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
		
		List<Paper> p=pdi.getPaperList(pl, num1, num2);
		
		PaperService ps=new PaperService();
		ps.setIsExamed(p);
		
		request.setAttribute("paperList", p);
		request.setAttribute("PageBean1",pb1);
		request.getRequestDispatcher("paperCheck.jsp").forward(request, response);
	}
	
	public void editPaper(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int paperno=Integer.parseInt(request.getParameter("paperno"));
		PaperDAOImp pdi=new PaperDAOImp();
		Paper paper=pdi.getPaper(paperno);
		HttpSession session=request.getSession();
		session.setAttribute("paper",paper);
		//离页提示
		session.setAttribute("isSaved", 0);
		
		request.setAttribute("isUpload", 2);
		request.getRequestDispatcher("paperGenerate.jsp").forward(request, response);
	}
}
