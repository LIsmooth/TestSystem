package cn.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.PresentationDirection;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;
import cn.hpe.po.PaperLimit;

public class PaperDAOImp extends BaseDAO implements PaperDAO{

	
	/**
	 * 上传试卷到数据库
	 * @throws Exception 
	 */
	@Override
	public int uploadPaper(Paper paper,String tno) throws Exception {
		// TODO Auto-generated method stub
		
		String sql="insert into paperinfo values (seq_pno.nextval,?,?,?,?,sysdate,?,?,?)";
		
		String sql2="insert into papermanage values (seq_pno.currval,?,?,?,?)";
		
		Connection conn=super.getConnection();
		
		PreparedStatement ps;
		
		ps=conn.prepareStatement(sql);
		ps.setObject(1, paper.getSubjectId());
		ps.setObject(2, paper.getPaperDegree());
		ps.setObject(3, paper.getStartSection());
		ps.setObject(4, paper.getEndSection());
		ps.setObject(5, tno);
		ps.setObject(6, paper.getPapername());
		ps.setObject(7, paper.getRemark());
		ps.execute();
		
		ps=conn.prepareStatement(sql2);
		int qid=1;//题号
		
		List<MultiQuestion> multiList=paper.getMultiList();
		
		for(MultiQuestion mq:multiList){
			ps.setObject(1, mq.getIsmultiple());
			ps.setObject(2, mq.getQuestionno());
			ps.setObject(3, mq.getQuestionmark());
			ps.setObject(4, qid);
			ps.execute();
			++qid;
		}
			
		List<EssayQuestion> essayList=paper.getEssayList();
		
		for(EssayQuestion eq:essayList){
			ps.setObject(1, eq.getIsessay());
			ps.setObject(2, eq.getQuestionno());
			ps.setObject(3, eq.getQuestionmark());
			ps.setObject(4, qid);
			ps.execute();
			++qid;
		}
		
		super.closeConnection(null, ps, conn);
		
		return 1;
	}
	
	
	/**
	 * 根据paperno获得试卷
	 * @throws Exception 
	 */
	@Override
	public Paper getPaper(String paperno) throws Exception{
		
		Paper paper=new Paper();
		
		String sql1="select * from paperinfo";
		String sql2="select * from multiquestions where questionno in(select questionno from papermanage where paperno=? and typeid<=2)";
		String sql3="select * from essayquestion where questionno in(select questionno from papermanage where paperno=? and typeid>2)";
		
		Connection conn=super.getConnection();
		PreparedStatement ps;
		
		ps=conn.prepareStatement(sql1);
		ResultSet rs=ps.executeQuery();
		rs.next();
		paper.setPaperno(rs.getInt("paperno"));
		paper.setSubjectId(rs.getString("subjectid"));
		paper.setPaperDegree(rs.getInt("quesitonlevel"));
		paper.setStartSection(rs.getInt("startsection"));
		paper.setEndSection(rs.getInt("endsection"));
		paper.setGenerateDate(rs.getDate("generatedate"));
		paper.setTno(rs.getString("tno"));
		paper.setPapername(rs.getString("papername"));
		paper.setRemark(rs.getString("remark"));
		
		QuestionDAOImp qdi=new QuestionDAOImp();
		
		ps=conn.prepareStatement(sql2);
		ps.setObject(1, paperno);
		rs=ps.executeQuery();
		paper.setMultiList(qdi.packMultiList(rs));
		
		ps=conn.prepareStatement(sql3);
		ps.setObject(1, paperno);
		rs=ps.executeQuery();
		paper.setEssayList(qdi.packEssayList(rs));
		
		super.closeConnection(rs, ps, conn);
		return paper;
	}

	/**
	 * 根据PaperLimit获得试卷个数
	 * @param pl
	 * @return
	 * @throws Exception 
	 */
	@Override
	public int getPaperNum(PaperLimit pl) throws Exception {
		// TODO Auto-generated method stub
		String sql="select count(paperno) from paperinfo where 1=1 "+pl.getLimit();
		
		Connection conn=super.getConnection();
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		int result=0;
		if(rs.next()){
			result=rs.getInt(1);
		}
		super.closeConnection(rs, ps, conn);
		return result;
	}

	
	/**
	 * 根据pl分页获得试卷列表
	 * @param pl
	 * @param startRow
	 * @param endRow
	 * @return
	 * @throws SQLException 
	 * @throws Exception 
	 */
	@Override
	public List<Paper> getPaperList(PaperLimit pl, int startRow, int endRow) throws Exception {
		// TODO Auto-generated method stub
		
		Connection conn = super.getConnection();
		List<Paper> paperList = new ArrayList<Paper>();
		String sql = "select p.*,t.tname,s.subjectname from paperinfo p,teacher t,subjectinfo s where p.tno=t.tno and s.subjectid=p.subjectid" + pl.getLimit()+" order by generatedate";
		sql = "select * from (select t.*,rownum rn from (" + sql + ") t "
				+ "where rownum<=" + endRow + ") where rn>" + startRow;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Paper p=new Paper();
			p.setPaperno(rs.getInt("paperno"));
			p.setSubjectId(rs.getString("subjectname"));
			p.setPaperDegree(rs.getInt("questionlevel"));
			p.setStartSection(rs.getInt("startsection"));
			p.setEndSection(rs.getInt("endsection"));
			p.setPapername(rs.getString("papername"));
			p.setGenerateDate(rs.getDate("generatedate"));
			p.setTno(rs.getString("tname"));
			p.setRemark(rs.getString("remark"));
			paperList.add(p);
		}
		return paperList;
	}
}
