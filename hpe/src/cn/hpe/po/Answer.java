package cn.hpe.po;

import java.util.List;
import java.util.Map;

/**
 * ѧ����ʵ����
 * @author Administrator
 *
 */
public class Answer {
	private int paperNo;			//�Ծ���
	private String sno;				//ѧ��ѧ��	
    private Map<String,String> studentanswer;//�𰸣���Ϊqid(inpaperno)��ֵΪ��
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
