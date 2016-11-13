package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hpe.dao.ExamDAO;
import cn.hpe.dao.ExamDAOImp;
import cn.hpe.dao.PaperDAO;
import cn.hpe.dao.PaperDAOImp;
import cn.hpe.po.PaperManage;

@WebServlet(urlPatterns="/PaperUserServlet")
public class PaperUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PaperDAO pd = new PaperDAOImp();
		ExamDAO ed = new ExamDAOImp();
		PaperManage pm =new PaperManage();
		PrintWriter out = response.getWriter();
		String paperId=request.getParameter("paperId");
		int newPaperId=paperId.equals("")?0:Integer.parseInt(paperId);
		String subjectId=request.getParameter("subjectId");
		pm.setPaperNo(paperId);
		pm.setSubjectId(subjectId);
		boolean isSuc=false,isFind=false;
		try {
			isSuc = pd.isExamed(newPaperId);
			isFind=ed.findPaper(pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(isFind){
			if (isSuc) {
				out.print("试卷已用于考试,请重新输入");
			}
			else
			{
				out.print("试卷可以使用");
			}
		}
		else{
			out.print("该科目试卷编号不存在");
		}
		out.close();
	}

}
