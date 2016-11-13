package cn.hpe.po;

import java.io.Serializable;

public class ExamClass implements Serializable{
	private String examNo;			//考试编号
	private String paperNo;			//试卷编号
	private String examName;		//考试名称
	private String classid;			//班级id
	private int countStu;			//班级人数
	private int countExamStu;		//参加考试人数
	private int countNotExamStu;	//缺考人数
	
	public ExamClass(){
		
	}

	public ExamClass(String examNo, String paperNo, String examName,
			String classid, int countStu, int countExamStu, int countNotExamStu) {
		this.examNo = examNo;
		this.paperNo = paperNo;
		this.examName = examName;
		this.classid = classid;
		this.countStu = countStu;
		this.countExamStu = countExamStu;
		this.countNotExamStu = countNotExamStu;
	}

	public String getPaperNo() {
		return paperNo;
	}

	public void setPaperNo(String paperNo) {
		this.paperNo = paperNo;
	}

	public String getExamNo() {
		return examNo;
	}

	public void setExamNo(String examNo) {
		this.examNo = examNo;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public int getCountStu() {
		return countStu;
	}

	public void setCountStu(int countStu) {
		this.countStu = countStu;
	}

	public int getCountExamStu() {
		return countExamStu;
	}

	public void setCountExamStu(int countExamStu) {
		this.countExamStu = countExamStu;
	}

	public int getCountNotExamStu() {
		return countNotExamStu;
	}

	public void setCountNotExamStu(int countNotExamStu) {
		this.countNotExamStu = countNotExamStu;
	}
	
}
