package cn.hpe.dao;



import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.QuestionLimit;

public interface QuestionDAO {
	//得到所有选择题
	public List<MultiQuestion> getAllMultiQuestion(QuestionLimit ql,int num1,int num2)throws Exception;
	
	//得到题库表里的题目数量 true表示选择题  flase表示问答题
	public int getCountQuestion(QuestionLimit ql)throws Exception;
	
	//根据科目id、题目类型、难度、开始和结束章节获得题库中题的数量
	public int getCountQuestionBySubjectid(QuestionLimit ql)throws Exception;
	
	//根据科目id、行数、题目类型、难度、开始和结束章节得到选择题
	public List<?> getQuestionByNum(QuestionLimit ql,int[] rowNum) throws Exception;
	
	//根据ResultSet封装选择题实体,isInpaper用来标识是否是从paperinfo中读题
	public List<MultiQuestion> packMultiList(ResultSet rs,int isInpaper);
	
	//根据RestultSet封装问答题实体,isInpaper用来标识是否是从paperinfo中读题
	public List<EssayQuestion> packEssayList(ResultSet rs,int isInpaper);
	
	//得到所有问答题
	public List<EssayQuestion> getAllEssayQuestion(QuestionLimit ql,int num1,int num2)throws Exception;

	//添加选择题
	public boolean addMultiQuestion(MultiQuestion mq, boolean flag) throws Exception;

	//添加问答题
	public boolean addEssayQuestion(EssayQuestion eq, boolean flag) throws Exception;

	//根据questionno得到EssayQuestion所有属性
	public EssayQuestion getEssayQuestionByQuestionNo(int questionno) throws Exception;
	
	//根据questionno得到MultiQuestion所有属性
	public MultiQuestion getMultiQuestionByQuestionNo(int questionno) throws Exception;

	//根据questionno,questionType删除Question
	public boolean delQuestionByQuestionNo(int questionno, String questionType) throws Exception;

	//根据question(题目)查找question信息
	public Map<String, Object> findQuestionByQuestion(String question) throws Exception;
}
