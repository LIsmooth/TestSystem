package cn.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.Answer;
import cn.hpe.po.PaperManage;
import cn.hpe.po.Score;
import cn.hpe.po.Student;

public class StudentDAOImpl extends BaseDAO implements StudentDAO {
    //初始化参数
	PreparedStatement ps=null;
	ResultSet rs=null;
	Connection conn=null;
	
	
	@Override//登录
	public boolean login(String username, String pwd) {
		boolean logined=false;
		try {
			conn=super.getConnection();
			String sql="select * from student where sno=? and spwd=?";
			ps=conn.prepareStatement(sql);
			ps.setObject(1,username);
			ps.setObject(2,pwd);
			rs=ps.executeQuery();
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

	@Override//获取学生信息
	public Student getStudentInfo(Student student) {
		Student s=new Student();
		
		try {
			conn=super.getConnection();
			String sql="select * from student where sno=?";
			ps=conn.prepareStatement(sql);
			ps.setObject(1,student.getSno());
			rs=ps.executeQuery();
			if(rs.next()){
				s.setSno(rs.getString("sno"));
				s.setSname(rs.getNString("sname"));
				s.setMajor(rs.getString("major"));
				s.setClassid(rs.getString("classid"));
				s.setSpwd(rs.getString("spwd"));
			}
			super.closeConnection(rs, ps, conn);	
		} catch (Exception e) {	
			e.printStackTrace();
		}	
		return s;
	}

	@Override//修改密码
	public int updateStudentPwd(Student student) {
		int result=0;
		try {
			conn=super.getConnection();
			String sql="update student set spwd=? where sno=?";
			ps=conn.prepareStatement(sql);
			ps.setObject(1,student.getSpwd());
			ps.setObject(2,student.getSno());
			result=ps.executeUpdate();
			super.closeConnection(rs, ps, conn);	
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return result;
	}

	@Override//获得试卷信息
	public List<PaperManage> getExamInfo(String sno) {
		List<PaperManage> lpm=new ArrayList<PaperManage>();
		
		String sql1="select examno,examname,subjectname,tname,e.paperno,e.classids,"
				+ "examtime,totaltime from exammanage e,teacher t,paperinfo p,"
				+ "subjectinfo s where e.paperno=p.paperno and "
				+ "p.tno=t.tno and e.subjectid=s.subjectid order by e.examno desc";
		try {
			conn=super.getConnection();
			ps=conn.prepareStatement(sql1);			
			rs=ps.executeQuery();			
			while(rs.next()){
				PaperManage pm=new PaperManage();
				pm.setExamNo(rs.getInt("examno"));
				pm.setPaperName(rs.getString("examname"));
				pm.setSubjectId(rs.getString("subjectname"));
				pm.setTeaName(rs.getString("tname"));
				pm.setExamTime(rs.getDate("examtime").toString());
				pm.setTotalTime(rs.getString("totaltime"));
				pm.setPaperNo(Integer.toString(rs.getInt("paperno")));
				pm.setClassList(rs.getString("classids"));
				StudentDAO sd=new StudentDAOImpl();
				int isStudentExam=sd.isStudentExam(rs.getInt("paperno"),Integer.parseInt(sno));
				pm.setIsStudentExam(isStudentExam);
				lpm.add(pm);				
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}	finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lpm;
	}

	@Override//查询密码
	public List<Score> getScore(String sno) {
		List<Score> ls=new ArrayList<Score>();
		
		String sql="select s.examno,s.ptscore,s.etscore,e.examname,s.score,"
				+ "e.examtime,sj.subjectname from scoremanage s,"
				+ "exammanage e,subjectinfo sj where sno=? and "
				+ "e.examno=s.examno and e.subjectid=sj.subjectid";
		try {
			conn=super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, sno);
			rs=ps.executeQuery();
			while(rs.next()){
				Score sc=new Score();
				sc.setExamno(rs.getInt("examno"));
				sc.setPtscore(rs.getInt("ptscore"));
				sc.setEtscore(rs.getInt("etscore"));
				sc.setScore(rs.getInt("score"));
				sc.setExamname(rs.getString("examname"));
				sc.setSubjectname(rs.getString("subjectname"));
				sc.setExamdate(rs.getDate("examtime").toString());
				ls.add(sc);
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
				
	    return ls;
	}

	@Override//向answer表插数据
	public int insertStudentAnswer(Answer aw) {
		int row=0;
		String sql="insert into answer(PAPERNO,sno,QID,answer) values(?,?,?,?)";
		try {
			conn=super.getConnection();
			Set<?> set1=aw.getStudentanswer().keySet();
			Iterator<?> it1=set1.iterator();	
			while(it1.hasNext()){
				Object key = it1.next();
				ps=conn.prepareStatement(sql);
				ps.setObject(1, aw.getPaperNo());
				ps.setObject(2, aw.getSno());
				ps.setObject(3, key);
				ps.setObject(4, aw.getStudentanswer().get(key));
				row=ps.executeUpdate();
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	@Override
	public int isStudentExam(int paperno, int sno) {
		int result=0;
		String sql="select * from answer where paperno=? and sno=?";
		try {
			conn=super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setObject(1, paperno);
			ps.setObject(2, sno);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				result=1;
			}		
		}catch (Exception e) {
			e.printStackTrace();		
		}finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int studentExamStatus(int examno) {
		int examstatus=0;
		String sql="select examstatus from exammanage where examno=?";
		try {
			conn=super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setObject(1, examno);
			rs=ps.executeQuery();
			if(rs.next()){
				examstatus=rs.getInt("examstatus");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		return examstatus;
	}

	@Override
	public long getStudentLoginTime(String sno) {
		long loginTime=0;
		String sql="select slogintime from student where sno=?";
		try {
			conn=super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setObject(1, sno);
			rs=ps.executeQuery();
			if(rs.next()){
				loginTime=rs.getLong("slogintime");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginTime;
	}

	@Override
	public int setStudentLoginTime(String sno,long loginTime) {
		int r=0;
		String sql="update student set slogintime=? where sno=?";
		try {
			conn=super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setObject(1, loginTime);
			ps.setObject(2, sno);
			r=ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				super.closeConnection(rs, ps, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return r;
	}
    
}
