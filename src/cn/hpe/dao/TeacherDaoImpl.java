package cn.hpe.dao;

 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.net.aso.p;
import oracle.net.aso.r;
import cn.hpe.baseDAO.BaseDAO;

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
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return name;
	}

}
