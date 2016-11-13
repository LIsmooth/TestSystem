package cn.hpe.dao;

import java.util.List;

import cn.hpe.po.Answer;
import cn.hpe.po.PaperManage;
import cn.hpe.po.Score;
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
	
	/**
	 * 查看成绩
	 */
	public List<Score> getScore(String sno);
	
	/**
	 * 查询学生界面显示考试信息
	 */
	public List<PaperManage> getExamInfo(String sno);


    /**
     * 学生交卷，答案插入answer表
     * @param aw
     * @return
     */
	public int insertStudentAnswer(Answer aw);
	
	
	
	/**
	 * 查询是否考试过
	 */
	public int isStudentExam(int paperno,int sno);
	
	/**
	 * 查询考试状态
	 * 0试卷发布，不可考试
	 * 1可以考试
	 * 2强制收卷
	 */
	public int studentExamStatus(int examno);
	
	
	/**
	 * 得到学生登录时间
	 */
	public long getStudentLoginTime(String sno);
	
	/**
	 * 更新登录时间
	 */
	public int setStudentLoginTime(String sno,long loginStatus);
}
