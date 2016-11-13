package cn.hpe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.hpe.dao.PaperDAOImp;
import cn.hpe.dao.QuestionDAOImp;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;
import cn.hpe.po.QuestionLimit;
import cn.hpe.po.Sections;
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
		response.setContentType("text/html;charset=UTF-8");
		
		String function=request.getParameter("function");
		//System.out.println("pgs/function="+function);
		
		try{
		if("1".equals(function)) generatePaper(request, response);//�����Ծ�
		if("2".equals(function)) uploadPaper(request,response);	//�ϴ��Ծ����ݿ�
		if("3".equals(function)) checkIsExamed(request,response);//ajax�鿴�Ծ��Ƿ��Ѿ�������
		if("4".equals(function)) getQuestions(request,response);//ajax�޸��Ծ�ʱ�����Ŀ
		if("5".equals(function)) replaceQues(request,response);//ajaxѡ���滻
		if("6".equals(function)) setMark(request,response);//ajax�޸ķ���
		if("7".equals(function)) setMultiMarks(request,response);//ajax�޸�����ѡ�������
		}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	
	private void setMultiMarks(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int mark=Integer.parseInt(request.getParameter("mark"));
		HttpSession session=request.getSession();
		Paper p=(Paper)session.getAttribute("paper");
		session.removeAttribute("paper");
		for(MultiQuestion m:p.getMultiList()){
			m.setQuestionmark(mark);
		}
		//System.out.println("pgs/setMM/mark="+p.getMultiList().get(1).getQuestionmark());
		session.setAttribute("paper", p);

	}


	private void setMark(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int mark=Integer.parseInt(request.getParameter("mark"));
		//System.out.println("pgs/mark="+mark);
		int qinno=Integer.parseInt(request.getParameter("qinno"));
		HttpSession session=request.getSession();
		Paper p=(Paper)session.getAttribute("paper");
		session.removeAttribute("paper");
		if(qinno<=p.getMultiList().size()){//�ж�����
			p.getMultiList().get(qinno-1).setQuestionmark(mark);//���÷���
			//System.out.println("mOK"+p.getMultiList().get(qinno-1).getQuestionmark());
		}else{
			qinno=qinno-p.getMultiList().size();
			//System.out.println("pgs/setMark/qinno="+qinno);
			p.getEssayList().get(qinno-1).setQuestionmark(mark);
			//System.out.println("eOK"+p.getEssayList().get(qinno-1).getQuestionmark());
		}
		session.setAttribute("paper", p);
		
	}


	private void replaceQues(HttpServletRequest request,
			HttpServletResponse response) throws NumberFormatException, Exception {
		// TODO Auto-generated method stub
		String qno=request.getParameter("qno");
		String type=request.getParameter("type");
		String qinno=request.getParameter("qinno");
		
		PrintWriter out=response.getWriter();
		
		if(qno!=null&&type!=null&&qinno!=null){
			int qNo=Integer.parseInt(qno);
			int qInno=Integer.parseInt(qinno);
			
			HttpSession session=request.getSession();		
			Paper paper=(Paper)session.getAttribute("paper");
			//System.out.println("pgs/paperno="+paper.getPaperno());
			session.removeAttribute("paper");
			int mark=0;
			
			QuestionDAOImp qdi=new QuestionDAOImp();
			if("1".equals(type)||"2".equals(type)){	
				
				MultiQuestion mq=qdi.getMultiQuestionByQuestionNo(qNo);
				mq.setInpaperno(qInno);				
				mark=paper.getMultiList().get(qInno-1).getQuestionmark();//��֤�޸Ĺ��ķ�ֵ����
				mq.setQuestionmark(mark);
				paper.getMultiList().set(qInno-1,mq);
				//System.out.println(paper.getMultiList().get(0).getQuestion());
			}
			else{
				int qnum=qInno-paper.getMultiList().size()-1;
				EssayQuestion eq=qdi.getEssayQuestionByQuestionNo(qNo);
				eq.setInpaperno(qInno);
				mark=paper.getEssayList().get(qnum).getQuestionmark();
				eq.setQuestionmark(mark);
				paper.getEssayList().set(qnum,eq);
			}
			//��ҳ����
			session.setAttribute("isSaved", 1);
			session.setAttribute("paper",paper);
			out.print("1");
		}
		else out.print("0");
		
		
	}


	private void getQuestions(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String page=request.getParameter("page");
		String type=request.getParameter("type");
		//System.out.println("getQuestions="+page+"*"+type+"*"+qno);
		
		QuestionLimit ql=new QuestionLimit();
		ql.setQuestion_type(type);
		
		int p=Integer.parseInt(page);
		//ÿ����������
		int perNum=10;
		int num1=(p-1)*perNum;
		int num2=p*perNum;
		QuestionDAOImp qdi=new QuestionDAOImp();
		StringBuffer sb=new StringBuffer();
		
		//ѡ����
		if("1".equals(type)||"2".equals(type)){			
			List<MultiQuestion> qList=qdi.getAllMultiQuestion(ql, num1, num2);
			sb.append("[");
			for(MultiQuestion m:qList){
				String question=m.getQuestion().replace("\"","\\\"");
				sb.append("{\"qno\":\""+m.getQuestionno()+"\",\"question\":\""+question+"\"},");
				
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
		}
		//�ʴ�����
		else{
			List<EssayQuestion> qList=qdi.getAllEssayQuestion(ql, num1, num2);
			sb.append("[");
			for(EssayQuestion e:qList){
				String question=e.getQuestion().replace("\"","\\\"");
				sb.append("{\"qno\":\""+e.getQuestionno()+"\",\"question\":\""+question+"\"},");
				
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
		}
		String s=sb.toString();
		s=s.replace("\n","</br>");
		//System.out.println(s);
		PrintWriter out=response.getWriter();
		out.print(s);
		out.flush();
		
	}


	private void checkIsExamed(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String pno=request.getParameter("paperno");
		if(pno!=null){
			int paperno=Integer.parseInt(pno);
			PaperDAOImp pdi=new PaperDAOImp();
			PrintWriter out=response.getWriter();
			if(pdi.isExamed(paperno))
				out.print("1");
			else
				out.print("0");
		}
	}


	public void generatePaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PaperService ps=new PaperService();
		QuestionLimit ql=new QuestionLimit();
		ql.setSubject_id(request.getParameter("subjectid"));
		System.out.println(request.getParameter("beginsec"));
		ql.setBegin_section(Integer.parseInt(request.getParameter("beginsec")));
		ql.setEnd_section(Integer.parseInt(request.getParameter("endsec")));
		ql.setLevel_type(request.getParameter("degreetype"));
		int[] perNum=new int[3];
		perNum[0]=Integer.parseInt(request.getParameter("multinum"));
		perNum[1]=Integer.parseInt(request.getParameter("essaynum"));
		perNum[2]=Integer.parseInt(request.getParameter("programnum"));
		Paper p=null;
		
		try {
			p=ps.generatePaper(ql, perNum);
			//System.out.println("pgs/pno="+p.getPaperno());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(p!=null){
			HttpSession session = request.getSession(); 
			p.setPapername(request.getParameter("papername"));
			p.setRemark(request.getParameter("remark"));
			session.setAttribute("paper",p);
			request.setAttribute("isUpload", 1);
			//��ҳ��ʾ
			session.setAttribute("isSaved", 1);
			//System.out.println("pgs/degreetype="+p.getPaperDegree());
			request.getRequestDispatcher("paperGenerate.jsp").forward(request, response);
		}
	}
	
	public void uploadPaper(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session=request.getSession();
		
		String flag=request.getParameter("isUpload");
		if("0".equals(flag)){//ȡ��btn�������Ѿ��޸�Ϊjs����
			session.removeAttribute("paper");
			response.sendRedirect("paperInfo.jsp");
		}
		else{
			Paper paper=(Paper)session.getAttribute("paper");
			//System.out.println("pgs/degreetype2="+paper.getPaperDegree());
			session.removeAttribute("paper");
			PaperDAOImp pdi=new PaperDAOImp();
			
			int paperno=-1;//������ʾ�Ǹ��»��������ɵ�
			
			//System.out.println(flag+"is flag");
			
			if("2".equals(flag)){//����
				paperno=paper.getPaperno();
				pdi.deletePaperByNo(paperno);
				//System.out.println(paperno+"is paperno");
			}
			
			//"0"��Ϊ��ȡsessionȻ���ʦ��id
			String tNo=(String)session.getAttribute("userid");
			
			//System.out.println(paper.getMultiList().get(0).getQuestionmark());
			//System.out.println("1tNo="+tNo+"paperno"+paperno);
			
			if(pdi.uploadPaper(paper,tNo,paperno)==1){
				PrintWriter out=response.getWriter();
				out.write("<script>alert('����ɹ�');</script>");
				
				//��ת��papercheck
				response.sendRedirect("PaperCheckServlet");
			}
			
		}
	}
}
