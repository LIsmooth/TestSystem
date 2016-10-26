package cn.hpe.po;

public class ScoreInfo {
	private String subjectId;
	private String classId;
	private double avgScore;
	private int maxScore;
	private int minScore;
	
	public ScoreInfo(){
		
	}
	
	public ScoreInfo(String subjectId, String classId, double avgScore,
			int maxScore, int minScore) {
		this.subjectId = subjectId;
		this.classId = classId;
		this.avgScore = avgScore;
		this.maxScore = maxScore;
		this.minScore = minScore;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}
	public int getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(int maxScore) {
		this.maxScore = maxScore;
	}
	public int getMinScore() {
		return minScore;
	}
	public void setMinScore(int minScore) {
		this.minScore = minScore;
	}
	
}
