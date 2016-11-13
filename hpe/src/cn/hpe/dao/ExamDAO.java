package cn.hpe.dao;

import java.util.List;

import cn.hpe.po.ExamClass;
import cn.hpe.po.PaperManage;

public interface ExamDAO {
	//添加考试信息
	public boolean addExamMessage(PaperManage pm)throws Exception;
	
	//根据paperNo完善PaperManage实体的PaperTitle(试卷名称)和TNo(发布教师)属性
	public PaperManage updExamMessage(PaperManage pm)throws Exception;
	
	//查询某科目试卷是否存在
	public boolean findPaper(PaperManage pm)throws Exception;

	//得到考试总数
	public int getCountExam()throws Exception;

	//得到考试信息列表
	public List<PaperManage> getAllExamMessage(int num1, int num2) throws Exception;
	
	//得到某场考试每个班级实考人数,缺考人数
	public List<ExamClass> getExamEveryClassMessage(List<ExamClass> lec)throws Exception;

	//设置考试状态为1:开始考试
	public boolean setBaginExam(String examNo)throws Exception;

	//设置考试状态为2:考试结束
	public boolean setEndExam(String examNo)throws Exception;
}
