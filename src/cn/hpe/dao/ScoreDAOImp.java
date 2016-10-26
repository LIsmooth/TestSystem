package cn.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.ClassScore;
import cn.hpe.po.ScoreInfo;
import cn.hpe.po.ScoreLimit;

public class ScoreDAOImp extends BaseDAO implements ScoreDAO {
	
	String sql="";
	PreparedStatement ps=null;
	Connection conn=null;
	ResultSet rs=null;

	/**
	 * 统计各班级成绩信息
	 */
	@Override
	public List<ScoreInfo> getClassScore(ScoreLimit sl) throws Exception {
		List<ScoreInfo> lsi = new ArrayList<ScoreInfo>();
		conn=super.getConnection();
		sql="select t.subjectid,t.classid,avg(score) score,max(score),min(score) from (select em.subjectid,ci.classname,ci.classid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)t where 1=1"+sl.getLimit()+" group by t.classid,t.subjectid"+sl.getOrder();
		System.out.println(sql);
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			ScoreInfo si = new ScoreInfo();
			si.setSubjectId(rs.getString("subjectId"));
			si.setClassId(rs.getString("classId"));
			si.setAvgScore(rs.getDouble("score"));
			si.setMaxScore(rs.getInt("max(score)"));
			si.setMinScore(rs.getInt("min(score)"));
			lsi.add(si);
		}
		super.closeConnection(rs, ps, conn);
		return lsi;
	}

	/**
	 * 计算记录总数
	 */
	@Override
	public int getCountClassScore(ScoreLimit sl) throws Exception {
		conn=super.getConnection();
		int count=0;
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where 1=1"+sl.getLimit();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		super.closeConnection(rs, ps, conn);
		return count;
	}

	/**
	 * 分页显示班级成绩信息
	 */
	@Override
	public List<ClassScore> getClassScoreByClassId(ScoreLimit sl, int num1,
			int num2) throws Exception {
		conn = super.getConnection();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		sql="select * from(select t.*,rownum rn from (select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno order by score desc)t where 1=1"+sl.getLimit()+" and rownum<="+num2+")s where rn>"+num1;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
			ClassScore cs = new ClassScore();
			cs.setSno(rs.getString("sno"));
			cs.setSname(rs.getString("sname"));
			cs.setClassId(rs.getString("classId"));
			cs.setSubjectId(rs.getString("subjectId"));
			cs.setScore(rs.getInt("score"));
			lcs.add(cs);
		}
		super.closeConnection(rs, ps, conn);
		return lcs;
	}

	/**
	 * 按成绩区间统计各成绩区间人数
	 */
	@Override
	public int[] getTotalClassScore(ScoreLimit sl) throws Exception {
		int[] arr = {0,0,0,0,0};
		conn=super.getConnection();
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where 1=1 and score<60"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[0]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where 1=1 and score>=60 and score<70"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[1]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where 1=1 and score>=70 and score<80"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[2]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where 1=1 and score>=80 and score<90"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[3]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where 1=1 and score>=90 and score<=100"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[4]=rs.getInt(1);
		}
		
		super.closeConnection(rs, ps, conn);
		return arr;
	}

	/**
	 * 根据ID查询某学生成绩
	 */
	@Override
	public List<ClassScore> getScoreByStudentId(String studentId)
			throws Exception {
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		conn=super.getConnection();
		sql="select * from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where sno="+studentId;
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			ClassScore cs = new ClassScore();
			cs.setSno(rs.getString("sno"));
			cs.setSname(rs.getString("sname"));
			cs.setClassId(rs.getString("classId"));
			cs.setSubjectId(rs.getString("subjectId"));
			cs.setScore(rs.getInt("score"));
			lcs.add(cs);
		}
		super.closeConnection(rs, ps, conn);
		return lcs;
	}

}
