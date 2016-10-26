package cn.hpe.po;

public class QuestionLevel {
	private String levelId;
	private String levelName;
	
	public QuestionLevel(){
		
	}
	public QuestionLevel(String levelId, String levelName) {
		this.levelId = levelId;
		this.levelName = levelName;
	}
	public String getLevelId() {
		return levelId;
	}
	public void setLevelId(String levelId) {
		this.levelId = levelId;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	
	
}
