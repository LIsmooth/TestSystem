package cn.hpe.baseDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cn.hpe.po.SubjectInfo;

public class BaseDAO {
	public Connection getConnection() throws Exception {

		Connection conn = null;		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context
					.lookup("java:comp/env/jdbc/hpe");
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	
	public Connection getConnection2()throws Exception{
		String driverclass="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin://@localhost:1521:orcl";
		String user="hpe";
		String pass="123";
		Class.forName(driverclass);
		Connection conn=DriverManager.getConnection(url, user, pass);
		return conn;
	}
	
	public void closeConnection(ResultSet rs,PreparedStatement ps,Connection conn) throws Exception{
		if(rs!=null){
			rs.close();
		}
		if(ps!=null){
			ps.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
}
