package cn.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.ExamClass;
import cn.hpe.po.PaperManage;

public class ExamDAOImp extends BaseDAO implements ExamDAO {

	String sql="";
	PreparedStatement ps=null;
	Connection conn=null;
	ResultSet rs=null;
	/**
	 * 添加考试信息
	 */
	@Override
	public boolean addExamMessage(PaperManage pm) throws Exception {
		conn=super.getConnection();
		int row=0;
		sql="insert into exammanage(EXAMNO,TYPEID,SUBJECTID,PAPERNO,EXAMTIME,TOTALTIME,CHARGED,EXAMNAME,CLASSIDS,EXAMSTATUS) values(seq_examno.nextval,'A',?,?,to_date(?,'yyyy-mm-dd HH24:MI'),?,0,?,?,0)";
		ps=conn.prepareStatement(sql);
		ps.setObject(1, pm.getSubjectId());
		ps.setObject(2, pm.getPaperNo());
		ps.setObject(3, pm.getExamTime());
		ps.setObject(4, pm.getTotalTime());
		ps.setObject(5, pm.getPaperName());
		ps.setObject(6, pm.getClassList());
		row=ps.executeUpdate();
		super.closeConnection(rs, ps, conn);
		return row>0;
	}

	/**
	 * 查询某科目试卷是否存在
	 */
	@Override
	public boolean findPaper(PaperManage pm) throws Exception {
		boolean result=false;
		conn=super.getConnection();
		sql="select * from paperinfo where paperno = ? and subjectid = ?";
		ps=conn.prepareStatement(sql);
		ps.setObject(1, pm.getPaperNo());
		ps.setObject(2, pm.getSubjectId());
		rs=ps.executeQuery();
		result=rs.next();
		super.closeConnection(rs, ps, conn);
		return result;
	}

	/**
	 * 根据paperNo完善PaperManage实体的PaperTitle(试卷名称)和TNo(发布教师)属性
	 */
	@Override
	public PaperManage updExamMessage(PaperManage pm) throws Exception {
		conn=super.getConnection();
		sql="select papername,tname from paperinfo pi,teacher tc where paperno = ? and tc.tno=pi.tno";
		ps=conn.prepareStatement(sql);
		ps.setObject(1, pm.getPaperNo());
		rs=ps.executeQuery();
		if(rs.next()){
			pm.setTeaName(rs.getString("tname"));
			pm.setPaperName(rs.getString("papername"));
		}
		super.closeConnection(rs, ps, conn);
		return pm;
	}

	//得到考试总数
	@Override
	public int getCountExam() throws Exception {
		conn= super.getConnection();
		int result=0;
		sql="select count(*) from exammanage";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			result=rs.getInt(1);
		}
		super.closeConnection(rs, ps, conn);
		return result;
	}

	/**
	 * 得到所有考试信息
	 */
	@Override
	public List<PaperManage> getAllExamMessage(int num1, int num2) throws Exception {
		conn=super.getConnection();
		List<PaperManage> lpm = new ArrayList<PaperManage>();
		sql="select * from(select t.*,rownum rn from (select examno,classids,em.paperno,papername,pi.subjectId,tname,examtime,totaltime,examstatus from exammanage em,paperinfo pi,teacher tc where em.paperno=pi.paperno and pi.tno=tc.tno order by examno desc) t where rownum<"+num2+") where rn>"+num1;
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			PaperManage pm = new PaperManage();
			pm.setExamNo(rs.getInt("examno"));
			pm.setPaperNo(rs.getString("paperno"));
			pm.setPaperName(rs.getString("papername"));
			pm.setSubjectId(rs.getString("subjectId"));
			pm.setTeaName(rs.getString("tname"));
			pm.setExamTime(rs.getString("examtime"));
			pm.setTotalTime(rs.getString("totaltime"));
			pm.setClassList(rs.getString("classids"));
			pm.setExamStatus(rs.getInt("examstatus"));
			lpm.add(pm);
		}
		super.closeConnection(rs, ps, conn);
		return lpm;
	}

	/**
	 * 得到某场考试每个班级实考人数,缺考人数
	 */
	@Override
	public List<ExamClass> getExamEveryClassMessage(List<ExamClass> lec) throws Exception {
		conn=super.getConnection();
		for(int i = 0;i<lec.size();i++){
			sql="select count(*) from student where classid=?";
			ps=conn.prepareStatement(sql);
			ps.setObject(1, lec.get(i).getClassid());
			rs=ps.executeQuery();
			if(rs.next()){
				lec.get(i).setCountStu(rs.getInt(1));
			}
		}
		for(int i = 0;i<lec.size();i++){
			sql="select count(*) from (select distinct sd.sno from exammanage em,answer an,student sd where em.paperno=an.paperno and sd.sno=an.sno and sd.classid=? and em.examno=?)";
			ps=conn.prepareStatement(sql);
			ps.setObject(1, lec.get(i).getClassid());
			ps.setObject(2, lec.get(i).getExamNo());
			rs=ps.executeQuery();
			if(rs.next()){
				lec.get(i).setCountExamStu(rs.getInt(1));
			}
		}
		for(int i = 0;i<lec.size();i++){
			int num1=lec.get(i).getCountExamStu();
			int num2=lec.get(i).getCountStu();
			lec.get(i).setCountNotExamStu(num2-num1);
		}
		super.closeConnection(rs, ps, conn);
		return lec;
	}

	@Override
	public boolean setBaginExam(String examNo) throws Exception {
		conn=super.getConnection();
		sql="update exammanage set examstatus=1 where examno="+examNo;
		ps=conn.prepareStatement(sql);
		int result=ps.executeUpdate();
		super.closeConnection(rs, ps, conn);
		return result>0;
		
	}

	@Override
	public boolean setEndExam(String examNo)throws Exception{
		conn=super.getConnection();
		sql="update exammanage set examstatus=2 where examno="+examNo;
		ps=conn.prepareStatement(sql);
		int result=ps.executeUpdate();
		super.closeConnection(rs, ps, conn);
		return result>0;
	}

}
