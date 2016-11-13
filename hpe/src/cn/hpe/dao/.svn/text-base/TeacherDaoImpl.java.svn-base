package cn.hpe.dao;

 
import java.security.spec.PSSParameterSpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import oracle.net.aso.p;
import oracle.net.aso.r;
import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.Student;

public class TeacherDaoImpl extends BaseDAO implements TeacherDAO{
	 

	@Override
	public boolean login(String username, String pwd) {
		boolean logined=false;
		try {
			Connection conn=super.getConnection();
			String sql="select * from teacher where tno=? and tpwd=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1,username);
			ps.setObject(2,pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				logined=true;
			}
			else {
				logined=false;
			}
			super.closeConnection(rs, ps, conn);
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return logined;
	}

	@Override
	public String findName(String no) {
		String name=null;
		try {
			Connection conn=super.getConnection();
			String sql="select tname from teacher where tno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, no);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				name=rs.getString("tname");
			}
			super.closeConnection(rs, ps, conn);
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return name;
	}

	@Override
	public List<String> getAnswer(int paperno, String sno) throws Exception {
		List<String> answer=new ArrayList<>();
		 try {
			Connection conn=super.getConnection();
			String sql="select answer from answer  where paperno=? and sno=? order by qid";
			 
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, sno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				answer.add(rs.getString("answer"));
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			throw new Exception(e);
		}
		 if(answer.size()!=0){
			 return answer;
		 }
		 else {
			return null;
		}
		
	}

	@Override
	public List<String> getSno(int paperno,String classid) {
		List<String> snoList=new ArrayList<String>();
		 try {
			Connection conn=super.getConnection();
			String sql="select distinct sno from answer where paperno=? and sno in(select sno from student where classid=?) order by sno ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, classid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				snoList.add(rs.getString("sno"));
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
		 
		return snoList;
	}

	@Override
	public boolean getScore(int examno, String sno, int score) {
		boolean success=false;
		 try {
			Connection conn=super.getConnection();
			double pscore=30+0.7*score;
			String sql="insert into scoremanage values(?,?,30,?,?,'hehe')";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, examno);
			ps.setObject(2, sno);
			ps.setObject(3, score);
			ps.setObject(4, pscore);
			int r=ps.executeUpdate();
			if(r>=1){
				success=true;
			}
			conn.close();
			ps.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return success;
		
	}

	@Override
	public void setMark(int paperno, String sno, int qid, int score) {
		 try {
			Connection conn=super.getConnection();
			String sql="update answer set tmark=? where paperno=? and sno=? and qid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, score);
			ps.setObject(2, paperno);
			ps.setObject(3, sno);
			ps.setObject(4, qid);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Integer> getMark(int paperno, String sno) {
	 List<Integer> getMarkList=new ArrayList<>();
	 try {
		Connection conn=super.getConnection();
		String sql="select tmark from answer where paperno=? and sno=? order by qid";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setObject(1, paperno);
		ps.setObject(2, sno);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			getMarkList.add(rs.getInt(1));
		}
		super.closeConnection(rs, ps, conn);
	} catch (Exception e) {
		 
		e.printStackTrace();
	}
		return getMarkList;
	}

	@Override
	public boolean flag(int paperno, String sno) {
		boolean flag=false;
		try {
			Connection conn=super.getConnection();
			String sql="select distinct ischarged from answer where paperno=? and sno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, sno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
			int r=rs.getInt(1);
			if(r==1){
				flag=true;
			}
			
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	 
	@Override
	public int countQid(int paperno, String sno) {
		int count=0;
		 try {
			Connection conn=super.getConnection();
			String sql="select count(qid) from answer where paperno=? and sno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, sno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt(1);
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
		 
		return count;
	}

	@Override
	public void charged(int paperno, String sno) {
		 try {
			Connection conn=super.getConnection();
			String sql="update answer set ischarged=1 where paperno=? and sno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, sno);
			ps.executeUpdate();
			ps.close();
			conn.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	 
	@Override
	public int getFinal(int examno, String sno) {
		int score=0;
		try {
			Connection conn=super.getConnection();
			String sql="select score from scoremanage where examno=? and sno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, examno);
			ps.setObject(2, sno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				score=rs.getInt(1);
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
		return score;
	}
	
	
	 @Test
	@Override
	public List<Student> getStudent(int examno, int classid) {
		
		List<Student> listStu=new ArrayList<>();
		try {
			
			Connection conn=super.getConnection();
			String sql="select * from (select * from student) t1,(select distinct(sno) ts from answer a,exammanage e where a.paperno=e.paperno and examno=?) t2 where t1.sno=t2.ts and classid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, examno);
			ps.setObject(2, classid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				 Student stu=new Student();
				 stu.setSno(rs.getString("sno"));
				 stu.setSname(rs.getString("sname"));
				 stu.setMajor(rs.getString("major"));
				 listStu.add(stu);
				 
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listStu;
	}

	@Override
	public String getSname(String sno) {
		String sname=null;
		try {
			Connection conn=super.getConnection();
			String sql="select sname from student where sno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setObject(1, sno);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
			  sname=rs.getString("sname"); 
			}
			super.closeConnection(rs, ps, conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sname;
	}
}
