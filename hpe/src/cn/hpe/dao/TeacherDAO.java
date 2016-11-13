package cn.hpe.dao;

import java.util.List;

import cn.hpe.po.Student;

public interface TeacherDAO {
	/**
	 * 登录
	 * @param username
	 * @param pwd
	 * @return
	 */
	public boolean login(String username,String pwd);
	
	
	/**
	 * 查找姓名
	 * @param no
	 * @return
	 */
	
	public String findName(String no);
	
	/**
	 * 获得学生选择题答案的集合方法
	 */
	public List<String> getAnswer(int paperno,String sno)  throws Exception;
	
	
	/**
	 * 获得某个paperno下的所有sno
	 */
	public List<String> getSno(int paperno,String classid);
	
	
	/**
	 * 把学生成绩存入数据库
	 */
		
	public boolean getScore(int examno,String sno,int score);
	
	
	/**
	 *  把 所有答案存入数据库
	 */
	public void setMark(int paperno,String sno,int qid,int score);
	
	
	/**
	 * 获得学生所有分数
	 */
	public List<Integer> getMark(int paperno,String sno);
	
	
	/**
	 * 判断该学生的试卷是否被改过
	 */
	public boolean flag(int paperno,String sno);
	
	
	/**
	 * 得到qid的总数
	 */
	public int  countQid(int paperno,String sno);
	
	
	/**
	 * 标志该试卷是否被改过
	 */
	public void charged(int paperno,String sno);
	
	/**
	 * 获得学生最终成绩
	 */
	public int getFinal(int examno,String sno);
	
	
	/**
	 * 查找学生姓名
	 */
	public String getSname(String sno);
	
	
	/**
	 * 获得某场考试下固定班级的学生集合
	 */
	public List<Student> getStudent(int examno,int classid);
		
	 
		
	 
		
	 
		
	 
	 
	 

}
