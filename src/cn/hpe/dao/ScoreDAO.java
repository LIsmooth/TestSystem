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
	public int getCountClassScore(ScoreLimit sl) throws Exception;

	//��ҳ��ʾ�༶�ɼ���Ϣ
	public List<ClassScore> getClassScoreByClassId(ScoreLimit sl, int num1,
			int num2) throws Exception;

	//���ɼ�����ͳ�Ƹ��ɼ���������
	public int[] getTotalClassScore(ScoreLimit sl) throws Exception;

	//����ID��ѯĳѧ���ɼ�
	public List<ClassScore> getScoreByStudentId(String studentId) throws Exception;
}
