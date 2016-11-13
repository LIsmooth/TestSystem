package cn.hpe.dao;



import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.QuestionLimit;

public interface QuestionDAO {
	//�õ�����ѡ����
	public List<MultiQuestion> getAllMultiQuestion(QuestionLimit ql,int num1,int num2)throws Exception;
	
	//�õ����������Ŀ���� true��ʾѡ����  flase��ʾ�ʴ���
	public int getCountQuestion(QuestionLimit ql)throws Exception;
	
	//���ݿ�Ŀid����Ŀ���͡��Ѷȡ���ʼ�ͽ����½ڻ��������������
	public int getCountQuestionBySubjectid(QuestionLimit ql)throws Exception;
	
	//���ݿ�Ŀid����������Ŀ���͡��Ѷȡ���ʼ�ͽ����½ڵõ�ѡ����
	public List<?> getQuestionByNum(QuestionLimit ql,int[] rowNum) throws Exception;
	
	//����ResultSet��װѡ����ʵ��,isInpaper������ʶ�Ƿ��Ǵ�paperinfo�ж���
	public List<MultiQuestion> packMultiList(ResultSet rs,int isInpaper);
	
	//����RestultSet��װ�ʴ���ʵ��,isInpaper������ʶ�Ƿ��Ǵ�paperinfo�ж���
	public List<EssayQuestion> packEssayList(ResultSet rs,int isInpaper);
	
	//�õ������ʴ���
	public List<EssayQuestion> getAllEssayQuestion(QuestionLimit ql,int num1,int num2)throws Exception;

	//���ѡ����
	public boolean addMultiQuestion(MultiQuestion mq, boolean flag) throws Exception;

	//����ʴ���
	public boolean addEssayQuestion(EssayQuestion eq, boolean flag) throws Exception;

	//����questionno�õ�EssayQuestion��������
	public EssayQuestion getEssayQuestionByQuestionNo(int questionno) throws Exception;
	
	//����questionno�õ�MultiQuestion��������
	public MultiQuestion getMultiQuestionByQuestionNo(int questionno) throws Exception;

	//����questionno,questionTypeɾ��Question
	public boolean delQuestionByQuestionNo(int questionno, String questionType) throws Exception;

	//����question(��Ŀ)����question��Ϣ
	public Map<String, Object> findQuestionByQuestion(String question) throws Exception;
}
