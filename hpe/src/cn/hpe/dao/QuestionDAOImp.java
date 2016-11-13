package cn.hpe.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.QuestionLimit;

public class QuestionDAOImp extends BaseDAO implements QuestionDAO {
	
	String sql="";
	PreparedStatement ps=null;
	Connection conn=null;
	ResultSet rs=null;
	
	/**
	 * 得到所有选择题
	 */
	@Override
	public List<MultiQuestion> getAllMultiQuestion(QuestionLimit ql, int num1,
			int num2) throws Exception {
		conn = super.getConnection();
		List<MultiQuestion> lm = new ArrayList<MultiQuestion>();
		sql = "select * from multiquestions where 1=1" + ql.getLimit()+" order by questionno";
		sql = "select * from (select t.*,rownum rn from (" + sql + ") t "
				+ "where rownum<=" + num2 + ") where rn>" + num1;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next()) {
			MultiQuestion mq = new MultiQuestion();
			mq.setQuestionno(Integer.parseInt(rs.getString("questionno")));
			mq.setSubjectid(rs.getString("subjectid"));
			mq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
			mq.setQuestion(rs.getString("question"));
			mq.setQuestionA(rs.getString("questionA"));
			mq.setQuestionB(rs.getString("questionB"));
			mq.setQuestionC(rs.getString("questionC"));
			mq.setQuestionD(rs.getString("questionD"));
			mq.setRightanswer(rs.getString("rightanswer"));
			mq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
			mq.setQuestionmark(Integer.parseInt(rs.getString("questionmark")));
			mq.setIsmultiple(Integer.parseInt(rs.getString("ismultiple")));
			lm.add(mq);
		}

		super.closeConnection(rs, ps, conn);
		return lm;
	}

	/**
	 * 得到题库中题目的总数量
	 * ql为限制条件
	 */
	@Override
	public int getCountQuestion(QuestionLimit ql) throws Exception {
		conn=super.getConnection();
		int result=0;
		if("0".equals(ql.getQuestion_type())){
			sql="select count(*) from multiquestions where 1=1"+ql.getLimit();
		}
		if("1".equals(ql.getQuestion_type())||"2".equals(ql.getQuestion_type())){
			sql="select count(*) from multiquestions where 1=1"+ql.getLimit();
		}
		if("3".equals(ql.getQuestion_type())||"4".equals(ql.getQuestion_type())){
			sql="select count(*) from essayquestion where 1=1"+ql.getLimit();
		}
		ps = conn.prepareStatement(sql);
		rs= ps.executeQuery();
		if(rs.next()){
			result=rs.getInt(1);
		}
		super.closeConnection(rs, ps, conn);
		return result;
	}

	
	/**
	 * 根据科目id、题目类型（选择题为null）、难度、开始和结束章节获得题库中题的数量
	 */
	@Override
	public int getCountQuestionBySubjectid(QuestionLimit ql)throws Exception {
		conn=super.getConnection();
		int result=0;
		if(Integer.parseInt(ql.getQuestion_type())<=2){
			sql="select count(*) from multiquestions where 1=1 "+ql.getLimit();
		}
		else{
			sql="select count(*) from essayquestion where 1=1"+ql.getLimit();
		}
		ps = conn.prepareStatement(sql);		
		
		rs= ps.executeQuery();
		if(rs.next()){
			result=rs.getInt(1);
		}
		super.closeConnection(rs, ps, conn);
		return result;
	}

	
	/**
	 * 根据科目id、行数(随机数)、题目类型、难度、开始和结束章节得到题
	 * @throws Exception 
	 * 
	 */
	@Override
	public List<?> getQuestionByNum(QuestionLimit ql,int[] rowNum) throws Exception {
		// TODO Auto-generated method stub
		
		conn=super.getConnection();
		
		StringBuffer sb=new StringBuffer();
		sb.append("(");
		for(int r:rowNum){
			sb.append(r+",");
		}
		sb.append("-1)");
		
		if(Integer.parseInt(ql.getQuestion_type())<=2)
		{
			sql="select * from (select rownum a,multiquestions.* from multiquestions where 1=1"+ql.getLimit()+")where a in"+sb;
		}
		else{
			sql="select * from (select rownum a,essayquestion.* from essayquestion where 1=1"+ql.getLimit()+")where a in"+sb;
		}
		//System.out.println("qdi/sql="+sql);
		ps = conn.prepareStatement(sql);
		
		rs= ps.executeQuery();
		
		if(Integer.parseInt(ql.getQuestion_type())<=2){
			
			List<MultiQuestion> qlist=new ArrayList<>();
			
			qlist=this.packMultiList(rs,0);
			
			super.closeConnection(rs, ps, conn);
			
			return qlist;
			
		}else{
			
			List<EssayQuestion> qlist=new ArrayList<>();
			
			qlist=this.packEssayList(rs,0);
			
			super.closeConnection(rs, ps, conn);
			
			return qlist;
		}

	}


	/**
	 * 得到所有问答题
	 */
	@Override
	public List<EssayQuestion> getAllEssayQuestion(QuestionLimit ql, int num1,
			int num2) throws Exception {
		conn = super.getConnection();
		List<EssayQuestion> leq = new ArrayList<EssayQuestion>();
		if(ql.getQuestion_type().equals("3")||ql.getQuestion_type().equals("4")){
			sql="select * from essayquestion where 1=1"+ql.getLimit()+" order by questionno";
		}
		else{
			sql="select * from essayquestion where 1=1"+ql.getLimit()+" order by questionno";
		}
		sql="select * from (select t.*,rownum rn from ("+sql+") t "
				+ "where rownum<="+num2+") where rn>"+num1;
		ps = conn.prepareStatement(sql);
		rs= ps.executeQuery();
		while(rs.next()){
			EssayQuestion eq = new EssayQuestion();
			eq.setQuestionno(Integer.parseInt(rs.getString("questionno")));
			eq.setSubjectid(rs.getString("subjectid"));
			eq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
			eq.setQuestion(rs.getString("question"));
			eq.setRightanswer(rs.getString("rightanswer"));
			eq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
			eq.setQuestionmark(Integer.parseInt(rs.getString("questionmark")));
			eq.setIsessay(Integer.parseInt(rs.getString("isessay")));
			leq.add(eq);
		}
		
		super.closeConnection(rs, ps, conn);
		return leq;
	}

	/**
	 * 根据ResultSet封装选择题实体
	 * isInpaper用来标识是否是从paperinfo中读题
	 */
	@Override
	public List<MultiQuestion> packMultiList(ResultSet rs,int isInpaper) {
		// TODO Auto-generated method stub
		List<MultiQuestion> ml=new ArrayList<MultiQuestion>();
		String mark=isInpaper==1?"markinpaper":"questionmark";
		try {
			while (rs.next()) {
				MultiQuestion mq = new MultiQuestion();
				mq.setQuestionno(Integer.parseInt(rs.getString("questionno")));
				mq.setSubjectid(rs.getString("subjectid"));
				mq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
				mq.setQuestion(rs.getString("question"));
				mq.setQuestionA(rs.getString("questionA"));
				mq.setQuestionB(rs.getString("questionB"));
				mq.setQuestionC(rs.getString("questionC"));
				mq.setQuestionD(rs.getString("questionD"));
				mq.setRightanswer(rs.getString("rightanswer"));
				mq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
				mq.setQuestionmark(Integer.parseInt(rs.getString(mark)));
				mq.setIsmultiple(Integer.parseInt(rs.getString("ismultiple")));
				ml.add(mq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ml;
	}
	
	
	/**
	 * 根据ResultSet封装问答题实体
	 * isInpaper用来标识是否是从paperinfo中读题
	 */
	@Override
	public List<EssayQuestion> packEssayList(ResultSet rs,int isInpaper) {
		// TODO Auto-generated method stub
		List<EssayQuestion> el=new ArrayList<EssayQuestion>();
		String mark=isInpaper==1?"markinpaper":"questionmark";
		try {
			while(rs.next()){
				EssayQuestion eq = new EssayQuestion();
				eq.setQuestionno(Integer.parseInt(rs.getString("questionno")));
				eq.setSubjectid(rs.getString("subjectid"));
				eq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
				eq.setQuestion(rs.getString("question"));
				eq.setRightanswer(rs.getString("rightanswer"));
				eq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
				eq.setQuestionmark(Integer.parseInt(rs.getString(mark)));
				eq.setIsessay(Integer.parseInt(rs.getString("isessay")));
				el.add(eq);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return el;
	}

	/**
	 * 添加选择题
	 * @throws Exception 
	 */
	@Override
	public boolean addMultiQuestion(MultiQuestion mq, boolean flag) throws Exception {
		conn=super.getConnection();
		if(flag){
			sql="insert into multiquestions(QUESTIONNO,SUBJECTID,SECTIONID,QUESTIONA,QUESTIONB,QUESTIONC,QUESTIOND,RIGHTANSWER,QUESTIONLEVEL,QUESTION,ISMULTIPLE,QUESTIONMARK) values(seq_multiquestionno.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		}
		else{
			sql="update multiquestions set SUBJECTID=?,SECTIONID=?,QUESTIONA=?,QUESTIONB=?,QUESTIONC=?,QUESTIOND=?,RIGHTANSWER=?,QUESTIONLEVEL=?,QUESTION=?,ISMULTIPLE=?,QUESTIONMARK=? where questionno="+mq.getQuestionno();
		}
		ps = conn.prepareStatement(sql);
		ps.setObject(1, mq.getSubjectid());
		ps.setObject(2, mq.getSectionid());
		ps.setObject(3, mq.getQuestionA());
		ps.setObject(4, mq.getQuestionB());
		ps.setObject(5, mq.getQuestionC());
		ps.setObject(6, mq.getQuestionD());
		ps.setObject(7, mq.getRightanswer());
		ps.setObject(8, mq.getQuestionlevel());
		ps.setObject(9, mq.getQuestion());
		ps.setObject(10, mq.getIsmultiple());
		ps.setObject(11, mq.getQuestionmark());
		int result=ps.executeUpdate();
		super.closeConnection(rs, ps, conn);
		return result>0;	
	}

	/**
	 * 添加问答题
	 */
	@Override
	public boolean addEssayQuestion(EssayQuestion eq, boolean flag) throws Exception {
		conn=super.getConnection();
		if(flag){
			sql="insert into essayquestion(QUESTIONNO,SUBJECTID,QUESTION,RIGHTANSWER,QUESTIONLEVEL,SECTIONID,ISESSAY,QUESTIONMARK) values(seq_essayquestionno.nextval,?,?,?,?,?,?,?)";
		}
		else{
			sql="update essayquestion set SUBJECTID=?,QUESTION=?,RIGHTANSWER=?,QUESTIONLEVEL=?,SECTIONID=?,ISESSAY=?,QUESTIONMARK=? where questionno="+eq.getQuestionno();
		}	
		ps = conn.prepareStatement(sql);
		ps.setObject(1, eq.getSubjectid());
		ps.setObject(2, eq.getQuestion());
		ps.setObject(3, eq.getRightanswer());
		ps.setObject(4, eq.getQuestionlevel());
		ps.setObject(5, eq.getSectionid());
		ps.setObject(6, eq.getIsessay());
		ps.setObject(7, eq.getQuestionmark());
		int result=ps.executeUpdate();
		super.closeConnection(rs, ps, conn);
		return result>0;
	}
	
	/**
	 * 根据questionno得到问答题
	 */
	@Override
	public EssayQuestion getEssayQuestionByQuestionNo(int questionno) throws Exception {
		conn=super.getConnection();
		EssayQuestion eq = new EssayQuestion();
		sql="select * from essayquestion where questionno="+questionno;
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			eq.setQuestionno(questionno);
			eq.setSubjectid(rs.getString("subjectid"));
			eq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
			eq.setQuestion(rs.getString("question"));
			eq.setRightanswer(rs.getString("rightanswer"));
			eq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
			eq.setQuestionmark(Integer.parseInt(rs.getString("questionmark")));
			eq.setIsessay(Integer.parseInt(rs.getString("isessay")));
		}
		super.closeConnection(rs, ps, conn);
		return eq;
	}

	/**
	 * 根据questionno得到选择题
	 */
	@Override
	public MultiQuestion getMultiQuestionByQuestionNo(int questionno) throws Exception{
		conn=super.getConnection();
		MultiQuestion mq = new MultiQuestion();
		sql="select * from multiquestions where questionno="+questionno;
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			mq.setQuestionno(questionno);
			mq.setSubjectid(rs.getString("subjectid"));
			mq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
			mq.setQuestion(rs.getString("question"));
			mq.setQuestionA(rs.getString("questionA"));
			mq.setQuestionB(rs.getString("questionB"));
			mq.setQuestionC(rs.getString("questionC"));
			mq.setQuestionD(rs.getString("questionD"));
			mq.setRightanswer(rs.getString("rightanswer"));
			mq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
			mq.setQuestionmark(Integer.parseInt(rs.getString("questionmark")));
			mq.setIsmultiple(Integer.parseInt(rs.getString("ismultiple")));
		}
		super.closeConnection(rs, ps, conn);
		return mq;
	}

	@Override
	public boolean delQuestionByQuestionNo(int questionno, String questionType) throws Exception {
		conn=super.getConnection();
		if(questionType.equals("3")||questionType.equals("4")){
			sql="delete from essayquestion where questionno="+questionno;
		}
		else{
			sql="delete from multiquestions where questionno="+questionno;
		}
		PreparedStatement ps = conn.prepareStatement(sql);
		int result=ps.executeUpdate();
		super.closeConnection(rs, ps, conn);
		return result>0;
	}

	/**
	 * 根据question模糊查询
	 */
	@Override
	public Map<String, Object> findQuestionByQuestion(String question) throws Exception {
		Map<String,Object> questionMap = new HashMap<String,Object>();
		int i=0;
		conn=super.getConnection();
		sql="select * from multiquestions where question like '%"+question+"%'";
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			MultiQuestion mq = new MultiQuestion();
			mq.setQuestionno(Integer.parseInt(rs.getString("questionno")));
			mq.setSubjectid(rs.getString("subjectid"));
			mq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
			mq.setQuestion(rs.getString("question"));
			mq.setQuestionA(rs.getString("questionA"));
			mq.setQuestionB(rs.getString("questionB"));
			mq.setQuestionC(rs.getString("questionC"));
			mq.setQuestionD(rs.getString("questionD"));
			mq.setRightanswer(rs.getString("rightanswer"));
			mq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
			mq.setQuestionmark(Integer.parseInt(rs.getString("questionmark")));
			mq.setIsmultiple(Integer.parseInt(rs.getString("ismultiple")));
			questionMap.put("multi"+i, mq);
			i++;
		}
		super.closeConnection(rs, ps, conn);
		conn=super.getConnection();
		sql="select * from essayquestion where question like '%"+question+"%'";
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			EssayQuestion eq = new EssayQuestion();
			eq.setQuestionno(Integer.parseInt(rs.getString("questionno")));
			eq.setSubjectid(rs.getString("subjectid"));
			eq.setSectionid(Integer.parseInt(rs.getString("sectionid")));
			eq.setQuestion(rs.getString("question"));
			eq.setRightanswer(rs.getString("rightanswer"));
			eq.setQuestionlevel(Integer.parseInt(rs.getString("questionlevel")));
			eq.setQuestionmark(Integer.parseInt(rs.getString("questionmark")));
			eq.setIsessay(Integer.parseInt(rs.getString("isessay")));
			questionMap.put("essay"+i, eq);
			i++;
		}
		super.closeConnection(rs, ps, conn);
		return questionMap;
	}

}
