package cn.hpe.po;

import java.util.List;

/**
 * ѧ����ʵ����
 * @author Administrator
 *
 */
public class Answer {
	private int paperNo;			//�Ծ���
	private String sno;				//ѧ��ѧ��
	private List<String> answers;	//ѧ����

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
