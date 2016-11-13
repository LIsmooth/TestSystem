package cn.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.PresentationDirection;
import javax.servlet.jsp.tagext.TryCatchFinally;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;
import cn.hpe.po.PaperLimit;
import cn.hpe.service.PaperService;
/**
 * @试卷管理
 * @author 刘煜迪
 *
 */
public class PaperDAOImp extends BaseDAO implements PaperDAO {

	/**
	 * 上传试卷到数据库
	 * papaerno为-1时是插入，否则是更新
	 * @throws Exception
	 */
	@SuppressWarnings({ "resource", "null" })
	@Override
	public int uploadPaper(Paper paper, String tno,int paperno) throws Exception {
		// TODO Auto-generated method stub

		//System.out.println("2tNo="+tno+"paperno"+paperno);
		String sql=null;
		String sql2=null;
		//插入
		if(paperno==-1){
			sql = "insert into paperinfo values (seq_pno.nextval,?,?,?,?,sysdate,?,?,?)";
			sql2 = "insert into papermanage values (seq_pno.currval,?,?,?,?)";
		}
		//更新
		else{
			sql = "insert into paperinfo values ("+paperno+",?,?,?,?,sysdate,?,?,?)";
			sql2 = "insert into papermanage values ("+paperno+",?,?,?,?)";
		}

		Connection conn = null;
		PreparedStatement ps=null;
		try{
			conn=super.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setObject(1, paper.getSubjectId());
			ps.setObject(2, paper.getPaperDegree());
			ps.setObject(3, paper.getStartSection());
			ps.setObject(4, paper.getEndSection());
			ps.setObject(5, tno);
			ps.setObject(6, paper.getPapername());
			ps.setObject(7, paper.getRemark());
			ps.execute();

			ps = conn.prepareStatement(sql2);
			int qid = 1;// 题号

			List<MultiQuestion> multiList = paper.getMultiList();

			for (MultiQuestion mq : multiList) {
				ps.setObject(1, mq.getIsmultiple());
				ps.setObject(2, mq.getQuestionno());
				ps.setObject(3, mq.getQuestionmark());
				ps.setObject(4, qid);
				ps.execute();
				++qid;
			}

			List<EssayQuestion> essayList = paper.getEssayList();

			for (EssayQuestion eq : essayList) {
				ps.setObject(1, eq.getIsessay());
				ps.setObject(2, eq.getQuestionno());
				ps.setObject(3, eq.getQuestionmark());
				ps.setObject(4, qid);
				ps.execute();
				++qid;
			}
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		finally{
		super.closeConnection(null, ps, conn);
		}
	}

	/**
	 * 根据paperno获得试卷
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	@Override
	public Paper getPaper(int paperno) throws Exception {

		Paper paper = new Paper();
		String sql1 = "select * from paperinfo where paperno=?";
		String sql2 = "select * from multiquestions m,(select questionno,qid,questionmark markinpaper from papermanage where paperno=? and typeid<=2 order by qid) t where m.questionno=t.questionno";
		String sql3 = "select * from essayquestion q,(select questionno,qid,questionmark markinpaper from papermanage where paperno=? and typeid>2 order by qid)t where q.questionno=t.questionno";
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = super.getConnection();
			
			ps = conn.prepareStatement(sql1);
			ps.setObject(1, paperno);
			rs = ps.executeQuery();
			if(rs.next()){			
				paper.setPaperno(rs.getInt("paperno"));
				paper.setSubjectId(rs.getString("subjectid"));
				paper.setPaperDegree(rs.getInt("questionlevel"));
				paper.setStartSection(rs.getInt("startsection"));
				paper.setEndSection(rs.getInt("endsection"));
				paper.setGenerateDate(rs.getTimestamp("generatedate"));
				paper.setTno(rs.getString("tno"));
				paper.setPapername(rs.getString("papername"));
				paper.setRemark(rs.getString("remark"));
				
				QuestionDAOImp qdi = new QuestionDAOImp();
				
				ps = conn.prepareStatement(sql2);
				ps.setObject(1, paperno);
				rs = ps.executeQuery();
				paper.setMultiList(qdi.packMultiList(rs,1));
				
				ps = conn.prepareStatement(sql3);
				ps.setObject(1, paperno);
				rs = ps.executeQuery();
				paper.setEssayList(qdi.packEssayList(rs,1));
				
				PaperService psv=new PaperService();
				paper=psv.setQid(paper);
				return paper;
			}
			else return null;
		} finally {
			super.closeConnection(rs, ps, conn);
		}

	}

	/**
	 * 根据PaperLimit获得试卷个数
	 * 
	 * @param pl
	 * @return
	 * @throws Exception
	 */
	@Override
	public int getPaperNum(PaperLimit pl) throws Exception {
		// TODO Auto-generated method stub
		String sql = "select count(paperno) from(select p.*,t.tname,s.subjectname from paperinfo p,teacher t,subjectinfo s where p.tno=t.tno and s.subjectid=p.subjectid"+pl.getSubject_id()+" order by generatedate)"+pl.getLimit();

		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			conn=super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int result = 0;
			if (rs.next()) {
				result = rs.getInt(1);
			}
			return result;
		}finally{
			super.closeConnection(rs, ps, conn);
		}
	}

	/**
	 * 根据pl分页获得试卷列表
	 * 
	 * @param pl
	 * @param startRow
	 * @param endRow
	 * @return
	 * @throws SQLException
	 * @throws Exception
	 */
	@Override
	public List<Paper> getPaperList(PaperLimit pl, int startRow, int endRow)
			throws Exception {
		// TODO Auto-generated method stub

		Connection conn = super.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Paper> paperList = new ArrayList<Paper>();
		String sql = "select * from(select p.*,t.tname,s.subjectname from paperinfo p,teacher t,subjectinfo s where p.tno=t.tno and s.subjectid=p.subjectid"+pl.getSubject_id()+" order by generatedate desc)"+pl.getLimit();
		sql = "select * from (select t.*,rownum rn from (" + sql + ") t "
				+ "where rownum<=" + endRow + ") where rn>" + startRow;
		//System.out.println(sql);
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Paper p = new Paper();
				p.setPaperno(rs.getInt("paperno"));
				p.setSubjectId(rs.getString("subjectname"));
				p.setPaperDegree(rs.getInt("questionlevel"));
				p.setStartSection(rs.getInt("startsection"));
				p.setEndSection(rs.getInt("endsection"));
				p.setPapername(rs.getString("papername"));
				p.setGenerateDate(rs.getTimestamp("generatedate"));
				p.setTno(rs.getString("tname"));
				p.setRemark(rs.getString("remark"));
				paperList.add(p);
			}
			return paperList;
		} finally {
			super.closeConnection(rs, ps, conn);
		}

	}

	@SuppressWarnings("resource")
	@Override
	public int deletePaperByNo(int paperno) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(paperno);
		String sql1 = "delete papermanage where paperno='" + paperno + "'";
		String sql2 = "delete paperinfo where paperno='" + paperno + "'";

		Connection conn=null;
		PreparedStatement ps = null;
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql1);
			ps.execute();
			ps = conn.prepareStatement(sql2);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			super.closeConnection(null, ps, conn);
		}
		return 1;
	}
	
	/**
	 * 获得每种题型的分数
	 * @throws Exception 
	 */
	public int getMark(int paperno,int typeid) throws Exception{
		int mark=0;
		String sql="select distinct questionmark from papermanage where paperno=? and typeid=?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			conn = super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, typeid);
			rs=ps.executeQuery();
			if(rs.next()){
				mark=rs.getInt("questionmark");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeConnection(rs, ps, conn);
		}
		return mark;
		 		
	}

	/**
	 * 修改试卷
	 * @param paperno
	 * @return
	 * @throws Exception
	 */
	@Override
	public int editPaper(Paper paper) throws Exception {
		return 0;
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * 查看试卷是否已经进行过考试
	 * @param paperno
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean isExamed(int paperno) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from exammanage where paperno=?";
		//System.out.println("isExamed="+paperno);
		boolean flag=false;
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			
			conn=super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			rs=ps.executeQuery();
			if(rs.next())
				flag=true;
			return flag;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			super.closeConnection(rs, ps, conn);
		}
		return flag;
	}
}
