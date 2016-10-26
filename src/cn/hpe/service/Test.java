package cn.hpe.service;

import java.util.ArrayList;
import java.util.List;

import cn.hpe.dao.QuestionDAOImp;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;
import cn.hpe.po.QuestionLimit;

public class Test {

	/**
	 * ≤‚ ‘”√¿‡
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		PaperService ps=new PaperService();
		QuestionLimit ql=new QuestionLimit();
		ql.setBegin_section(0);
		ql.setEnd_section(10);
		ql.setSubject_id("1");
		//ql.setQuestion_type("3");
		
//		String q=ql.getLimit();
//		ql.setQuestion_type("1");
//		
//		ql.setLimit(q);
//		ql.setQuestion_type("2");
//		System.out.println(ql.getLimit());
//		
		int []perNum={20,3,1};
		
		Paper p=ps.generatePaper(ql, perNum);
		
		
		
		int i=0;
		
		List<MultiQuestion> eq=p.getMultiList();
		for(MultiQuestion m:eq){
			System.out.println("\n"+m.getInpaperno()+m.getQuestion());
			System.out.println("A"+m.getQuestionA());
			System.out.println("B"+m.getQuestionB());
			System.out.println("C"+m.getQuestionC());
			System.out.println("D"+m.getQuestionD());
			
		}
		
		
		List<EssayQuestion> mu=p.getEssayList();
		for(EssayQuestion m:mu){
			
			System.out.println("\n"+m.getInpaperno()+m.getQuestion());
		}
//		
		

		
//		int[] rowNum={2,5,3,8};
//		StringBuffer sb=new StringBuffer();
//		sb.append("(");
//		for(int r:rowNum){
//			sb.append(r+",");
//		}
//		sb.append("-1)");
//		
//		System.out.println(sb);

	}

}
