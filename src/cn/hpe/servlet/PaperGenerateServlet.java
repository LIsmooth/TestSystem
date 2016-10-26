package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.PaperDAOImp;
import cn.hpe.po.Paper;
import cn.hpe.po.QuestionLimit;
import cn.hpe.service.PaperService;

@WebServlet(urlPatterns="/PaperGenerateServlet")
public class PaperGenerateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String function=request.getParameter("function");
		System.out.println(function);
		if("1".equals(function)) generatePaper(request, response);
		if("2".equals(function))
			try {
				uploadPaper(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	public void generatePaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PaperService ps=new PaperService();
		QuestionLimit ql=new QuestionLimit();
		ql.setSubject_id(request.getParameter("subjectid"));
		ql.setBegin_section(Integer.parseInt(request.getParameter("beginsec")));
		ql.setEnd_section(Integer.parseInt(request.getParameter("endsec")));
		//ql.setLevel_type("degreetype");
		
		int[] perNum=new int[3];
		perNum[0]=Integer.parseInt(request.getParameter("multinum"));
		perNum[1]=Integer.parseInt(request.getParameter("essaynum"));
		perNum[2]=Integer.parseInt(request.getParameter("programnum"));
		Paper p=null;
		
		try {
			p=ps.generatePaper(ql, perNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(p!=null){
			HttpSession session = request.getSession(); 
			p.setPapername(request.getParameter("papername"));
			p.setRemark(request.getParameter("remark"));
			session.setAttribute("paper",p);
			request.getRequestDispatcher("paperGenerate.jsp").forward(request, response);
		}
	}
	
	public void uploadPaper(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session=request.getSession();
		if("0".equals(request.getParameter("isUpload"))){
			session.removeAttribute("paper");
			response.sendRedirect("paperInfo.jsp");
		}
		else{
			Paper paper=(Paper)session.getAttribute("paper");
			PaperDAOImp pdi=new PaperDAOImp();
			if(pdi.uploadPaper(paper,"0")==1){
				PrintWriter out=response.getWriter();
				out.write("<script>alert('保存成功！');</script>");
				//跳转到papercheck
			}
			
		}
	}
}
