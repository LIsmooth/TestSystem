package cn.hpe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.Student;

public class StudentDAOImpl extends BaseDAO implements StudentDAO {
    
	PreparedStatement ps=null;
	ResultSet rs=null;
	Connection conn=null;
	
	
	@Override
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

	@Override
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

	@Override
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
    
}
