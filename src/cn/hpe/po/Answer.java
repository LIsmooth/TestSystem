package cn.hpe.po;

import java.util.List;

/**
 * 学生答案实体类
 * @author Administrator
 *
 */
public class Answer {
	private int paperNo;			//试卷编号
	private String sno;				//学生学号
	private List<String> answers;	//学生答案

	public Answer() {

	}

	public Answer(int paperNo, String sno, List<String> answers) {
		this.paperNo = paperNo;
		this.sno = sno;
		this.answers = answers;
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

	public List<String> getAnswers() {
		return answers;
	}

	public void setAnswers(List<String> answers) {
		this.answers = answers;
	}
}
