package cn.hpe.dao;

import cn.hpe.po.Student;

public interface StudentDAO {
	/**
	 * ѧ����¼�ж�
	 * @param username
	 * @param pwd
	 * @return
	 */
	public boolean login(String username,String pwd);
	
	
	
	/**
	 * ��ѯѧ����Ϣ���������룩
	 */
	public Student getStudentInfo(Student student);
	
	
	/**
	 * ѧ���޸�����
	 */
	public int updateStudentPwd(Student student);
}
