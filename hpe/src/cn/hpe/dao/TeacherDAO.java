package cn.hpe.dao;

import java.util.List;

import cn.hpe.po.Student;

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
	
	/**
	 * ���ѧ��ѡ����𰸵ļ��Ϸ���
	 */
	public List<String> getAnswer(int paperno,String sno)  throws Exception;
	
	
	/**
	 * ���ĳ��paperno�µ�����sno
	 */
	public List<String> getSno(int paperno,String classid);
	
	
	/**
	 * ��ѧ���ɼ��������ݿ�
	 */
		
	public boolean getScore(int examno,String sno,int score);
	
	
	/**
	 *  �� ���д𰸴������ݿ�
	 */
	public void setMark(int paperno,String sno,int qid,int score);
	
	
	/**
	 * ���ѧ�����з���
	 */
	public List<Integer> getMark(int paperno,String sno);
	
	
	/**
	 * �жϸ�ѧ�����Ծ��Ƿ񱻸Ĺ�
	 */
	public boolean flag(int paperno,String sno);
	
	
	/**
	 * �õ�qid������
	 */
	public int  countQid(int paperno,String sno);
	
	
	/**
	 * ��־���Ծ��Ƿ񱻸Ĺ�
	 */
	public void charged(int paperno,String sno);
	
	/**
	 * ���ѧ�����ճɼ�
	 */
	public int getFinal(int examno,String sno);
	
	
	/**
	 * ����ѧ������
	 */
	public String getSname(String sno);
	
	
	/**
	 * ���ĳ�������¹̶��༶��ѧ������
	 */
	public List<Student> getStudent(int examno,int classid);
		
	 
		
	 
		
	 
		
	 
	 
	 

}
