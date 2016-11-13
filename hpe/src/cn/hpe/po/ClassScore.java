package cn.hpe.po;

public class ClassScore {
	private int examNo;
	private String examTitle;
	private String sno;
	private String sname;
	private String classId;
	private String subjectId;
	private int ptScore;
	private int etScore;
	private int score;
	
	public ClassScore(){
		
	}
	
	

	public ClassScore(int examNo, String examTitle, String sno, String sname,
			String classId, String subjectId, int ptScore, int etScore,
			int score) {
		super();
		this.examNo = examNo;
		this.examTitle = examTitle;
		this.sno = sno;
		this.sname = sname;
		this.classId = classId;
		this.subjectId = subjectId;
		this.ptScore = ptScore;
		this.etScore = etScore;
		this.score = score;
	}



	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	public int getPtScore() {
		return ptScore;
	}

	public void setPtScore(int ptScore) {
		this.ptScore = ptScore;
	}

	public int getEtScore() {
		return etScore;
	}

	public void setEtScore(int etScore) {
		this.etScore = etScore;
	}

	public int getExamNo() {
		return examNo;
	}

	public void setExamNo(int examNo) {
		this.examNo = examNo;
	}

	public String getExamTitle() {
		return examTitle;
	}

	public void setExamTitle(String examTitle) {
		this.examTitle = examTitle;
	}
	
}
