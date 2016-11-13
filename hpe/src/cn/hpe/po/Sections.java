package cn.hpe.po;

public class Sections {
	private int sectionId;
	private String sectionName;
	
	public Sections(){
		
	}
	
	public Sections(int sectionId, String sectionName) {
		this.sectionId = sectionId;
		this.sectionName = sectionName;
	}
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	
}
