package cn.hpe.po;

import java.util.List;
import java.util.Map;

/**
 * 学生答案实体类
 * @author Administrator
 *
 */
public class Answer {
	private int paperNo;			//试卷编号
	private String sno;				//学生学号	
    private Map<String,String> studentanswer;//答案，键为qid(inpaperno)，值为答案
	public Answer(int paperNo, String sno, Map<String, String> studentanswer) {
		this.paperNo = paperNo;
		this.sno = sno;
		this.studentanswer = studentanswer;
	}
	public Answer() {
	}
	public int getPaperNo() {
		return paperNo;
	}
	public void setPaperNo(int paperNo) {
		this.paperNo = paperNo;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public Map<String, String> getStudentanswer() {
		return studentanswer;
	}
	public void setStudentanswer(Map<String, String> studentanswer) {
		this.studentanswer = studentanswer;
	}
    
	
}
