package cn.hpe.po;

public class Score {

	int examno;//���Ա��
	int ptscore;//ƽʱ�ɼ�
	int etscore; //����ɼ�
	int score;//�ܳɼ�
	String examname;//��������
	String subjectname;//��Ŀ����
	String examdate;//����ʱ��
	
	public Score() {
		
	}

	public Score(int examno, int ptscore, int etscore, int score,
			String examname, String subjectname, String examdate) {
		this.examno = examno;
		this.ptscore = ptscore;
		this.etscore = etscore;
		this.score = score;
		this.examname = examname;
		this.subjectname = subjectname;
		this.examdate = examdate;
	}

	public int getExamno() {
		return examno;
	}

	public void setExamno(int examno) {
		this.examno = examno;
	}

	public int getPtscore() {
		return ptscore;
	}

	public void setPtscore(int ptscore) {
		this.ptscore = ptscore;
	}

	public int getEtscore() {
		return etscore;
	}

	public void setEtscore(int etscore) {
		this.etscore = etscore;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	public String getExamdate() {
		return examdate;
	}

	public void setExamdate(String examdate) {
		this.examdate = examdate;
	}
	
	
	
}
