package cn.hpe.dao;

import cn.hpe.po.Student;

public interface StudentDAO {
	/**
	 * 学生登录判断
	 * @param username
	 * @param pwd
	 * @return
	 */
	public boolean login(String username,String pwd);
	
	
	
	/**
	 * 查询学生信息（包括密码）
	 */
	public Student getStudentInfo(Student student);
	
	
	/**
	 * 学生修改密码
	 */
	public int updateStudentPwd(Student student);
}
