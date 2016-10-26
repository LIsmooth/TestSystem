package cn.hpe.dao;

import java.util.List;

import cn.hpe.po.ClassScore;
import cn.hpe.po.ScoreInfo;
import cn.hpe.po.ScoreLimit;

public interface ScoreDAO {
	/**
	 * 成绩查询
	 */
	//统计各班级成绩信息
	public List<ScoreInfo> getClassScore(ScoreLimit sl) throws Exception;

	//计算记录总数
	public int getCountClassScore(ScoreLimit sl) throws Exception;

	//分页显示班级成绩信息
	public List<ClassScore> getClassScoreByClassId(ScoreLimit sl, int num1,
			int num2) throws Exception;

	//按成绩区间统计各成绩区间人数
	public int[] getTotalClassScore(ScoreLimit sl) throws Exception;

	//根据ID查询某学生成绩
	public List<ClassScore> getScoreByStudentId(String studentId) throws Exception;
}
