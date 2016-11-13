package cn.hpe.dao;

import java.util.List;

import cn.hpe.po.ClassScore;
import cn.hpe.po.ScoreInfo;
import cn.hpe.po.ScoreLimit;

public interface ScoreDAO {
	/**
	 * �ɼ���ѯ
	 */
	//ͳ�Ƹ��༶�ɼ���Ϣ
	public List<ScoreInfo> getClassScore(ScoreLimit sl) throws Exception;

	//�����¼����
	public int getCountClassScore(ScoreLimit sl,String examNo) throws Exception;

	//��ҳ��ʾ�༶�ɼ���Ϣ
	public List<ClassScore> getClassScoreByClassId(ScoreLimit sl,String examNo, int num1,
			int num2) throws Exception;

	//���ɼ�����ͳ�Ƹ��ɼ���������
	public int[] getTotalClassScore(ScoreLimit sl,String examNo) throws Exception;

	//����ID��ѯĳѧ���ɼ�
	public List<ClassScore> getScoreByStudentId(String studentId) throws Exception;

	//�õ�ĳ��ĳ��Ŀȫ��ѧ���ɼ�
	public List<ClassScore> getClassPtScore(String subjectId, String classId)throws Exception;

	//���ð༶ȫ��ѧ��ƽʱ�ɼ�
	public boolean setClassPtScore(List<ClassScore> lcs)throws Exception;
}
