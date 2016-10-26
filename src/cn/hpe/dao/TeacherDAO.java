package cn.hpe.dao;

public interface TeacherDAO {
	/**
	 * µÇÂ¼
	 * @param username
	 * @param pwd
	 * @return
	 */
	public boolean login(String username,String pwd);
	
	
	/**
	 * ²éÕÒĞÕÃû
	 * @param no
	 * @return
	 */
	
	public String findName(String no);

}
