package cn.hpe.dao;

public interface TeacherDAO {
	/**
	 * ��¼
	 * @param username
	 * @param pwd
	 * @return
	 */
	public boolean login(String username,String pwd);
	
	
	/**
	 * ��������
	 * @param no
	 * @return
	 */
	
	public String findName(String no);

}
