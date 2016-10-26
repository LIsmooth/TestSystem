package cn.hpe.po;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 试卷实体类
 * @author Administrator
 *
 */
public class Paper {
	// private int paperno;
	// private String questiontype VARCHAR2(20),
	// private String questionno NUMBER(4) not null,
	// private String questionmark NUMBER(2),
	private int paperno;							//试卷编号
	private String papername;						//试卷名
	private String subjectId;						//课程编号
	private int paperDegree;						//试卷难度
	private int startSection;						//开始章节
	private int endSection;						//结束章节
	private Date generateDate;						//生成日期
	private String tno;								//出题人
	private String remark;							//备注
	private List<MultiQuestion> multiList;			//选择题列表	
	private List<EssayQuestion> essayList;			//问答题列表
	private Map<String, List<String>> answers;		//学生答案

	public Paper(){
		
	}

	public int getPaperno() {
		return paperno;
	}

	public void setPaperno(int paperno) {
		this.paperno = paperno;
	}

	public String getPapername() {
		return papername;
	}

	public void setPapername(String papername) {
		this.papername = papername;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public int getPaperDegree() {
		return paperDegree;
	}

	public void setPaperDegree(int paperDegree) {
		this.paperDegree = paperDegree;
	}

	public int getStartSection() {
		return startSection;
	}

	public void setStartSection(int startSection) {
		this.startSection = startSection;
	}

	public int getEndSection() {
		return endSection;
	}

	public void setEndSection(int endSection) {
		this.endSection = endSection;
	}

	public Date getGenerateDate() {
		return generateDate;
	}

	public void setGenerateDate(Date generateDate) {
		this.generateDate = generateDate;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<MultiQuestion> getMultiList() {
		return multiList;
	}

	public void setMultiList(List<MultiQuestion> multiList) {
		this.multiList = multiList;
	}

	public List<EssayQuestion> getEssayList() {
		return essayList;
	}

	public void setEssayList(List<EssayQuestion> essayList) {
		this.essayList = essayList;
	}

	public Map<String, List<String>> getAnswers() {
		return answers;
	}

	public void setAnswers(Map<String, List<String>> answers) {
		this.answers = answers;
	}

	
}
