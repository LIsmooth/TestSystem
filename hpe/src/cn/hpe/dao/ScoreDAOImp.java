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
		sql="select t.examno,t.subjectid,t.examtime,t.examname,t.classid,avg(score) score,max(score),min(score) from (select em.examno,em.subjectid,em.examtime,em.examname,ci.classname,ci.classid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)t where 1=1"+sl.getLimit()+" group by t.examno,t.classid,t.examtime,t.subjectid,t.examname"+sl.getOrder();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
			ScoreInfo si = new ScoreInfo();
			si.setExamNo(rs.getInt("examno"));
			si.setSubjectId(rs.getString("subjectId"));
			si.setExamDate(rs.getString("examtime"));
			si.setExamName(rs.getString("examname"));
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
	public int getCountClassScore(ScoreLimit sl,String examNo) throws Exception {
		conn=super.getConnection();
		int count=0;
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+")where 1=1"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
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
	public List<ClassScore> getClassScoreByClassId(ScoreLimit sl, String examNo, int num1,
			int num2) throws Exception {
		conn = super.getConnection();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		sql="select * from(select t.*,rownum rn from (select sd.sno,sd.sname,ci.classid,em.subjectid,sm.ptscore,sm.etscore,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+"order by score desc)t where 1=1"+sl.getLimit()+" and rownum<="+num2+")s where rn>"+num1;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
			ClassScore cs = new ClassScore();
			cs.setSno(rs.getString("sno"));
			cs.setSname(rs.getString("sname"));
			cs.setClassId(rs.getString("classId"));
			cs.setSubjectId(rs.getString("subjectId"));
			cs.setEtScore(rs.getInt("etscore"));
			cs.setPtScore(rs.getInt("ptscore"));
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
	public int[] getTotalClassScore(ScoreLimit sl,String examNo) throws Exception {
		int[] arr = {0,0,0,0,0};
		conn=super.getConnection();
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+")where 1=1 and score<60"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[0]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+")where 1=1 and score>=60 and score<70"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[1]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+")where 1=1 and score>=70 and score<80"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[2]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+")where 1=1 and score>=80 and score<90"+sl.getLimit();
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			arr[3]=rs.getInt(1);
		}
		sql="select count(*) from(select sd.sno,sd.sname,ci.classid,em.subjectid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno and em.examno="+examNo+")where 1=1 and score>=90 and score<=100"+sl.getLimit();
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
		sql="select * from(select em.examno,em.examname,sd.sno,sd.sname,ci.classid,em.subjectid,sm.ptscore,sm.etscore,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)where sno="+studentId;
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			ClassScore cs = new ClassScore();
			cs.setExamNo(rs.getInt("examNo"));
			cs.setExamTitle(rs.getString("examname"));
			cs.setSno(rs.getString("sno"));
			cs.setSname(rs.getString("sname"));
			cs.setClassId(rs.getString("classId"));
			cs.setSubjectId(rs.getString("subjectId"));
			cs.setPtScore(rs.getInt("ptscore"));
			cs.setEtScore(rs.getInt("etscore"));
			cs.setScore(rs.getInt("score"));
			lcs.add(cs);
		}
		super.closeConnection(rs, ps, conn);
		return lcs;
	}

	@Override
	public List<ClassScore> getClassPtScore(String subjectId, String classId) throws Exception {
		conn = super.getConnection();
		List<ClassScore> lcs = new ArrayList<ClassScore>();
		sql="select t.* from (select em.examno,em.examname,sd.sno,sd.sname,ci.classid,em.subjectid,sm.ptscore,sm.etscore,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno order by score desc)t where subjectid=? and classid=?";
		ps=conn.prepareStatement(sql);
		ps.setObject(1, subjectId);
		ps.setObject(2, classId);
		rs = ps.executeQuery();
		while(rs.next()){
			ClassScore cs = new ClassScore();
			cs.setExamNo(rs.getInt("examNo"));
			cs.setExamTitle(rs.getString("examname"));
			cs.setSno(rs.getString("sno"));
			cs.setSname(rs.getString("sname"));
			cs.setClassId(rs.getString("classId"));
			cs.setSubjectId(rs.getString("subjectId"));
			cs.setEtScore(rs.getInt("etscore"));
			cs.setPtScore(rs.getInt("ptscore"));
			cs.setScore(rs.getInt("score"));
			lcs.add(cs);
		}
		super.closeConnection(rs, ps, conn);
		return lcs;
	}

	/**
	 * 设置班级平时成绩
	 */
	@Override
	public boolean setClassPtScore(List<ClassScore> lcs)throws Exception {
		conn = super.getConnection();
		int result=0;
		for(int i = 0;i<lcs.size();i++){
			sql="update scoremanage set ptscore=?,score=? where sno=?";
			ps=conn.prepareStatement(sql);
			ps.setObject(1, lcs.get(i).getPtScore());
			ps.setObject(2, Math.round(lcs.get(i).getPtScore()+lcs.get(i).getEtScore()*0.7));
			ps.setObject(3, lcs.get(i).getSno());
			result=ps.executeUpdate(); 
		}
		super.closeConnection(rs, ps, conn);
		return result>0;
		
	}

}
