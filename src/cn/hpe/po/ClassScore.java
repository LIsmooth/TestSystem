package cn.hpe.po;

public class ClassScore {
	private String sno;
	private String sname;
	private String classId;
	private String subjectId;
	private int score;
	
	public ClassScore(){
		
	}
	public ClassScore(String sno, String sname, String classId,
			String subjectId, int score) {
		this.sno = sno;
		this.sname = sname;
		this.classId = classId;
		this.subjectId = subjectId;
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
}
