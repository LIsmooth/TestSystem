package cn.hpe.po;

public class ClassInfo {
	private String classId;
	private String className;
	
	public ClassInfo(){
		
	}
	
	public ClassInfo(String classId, String className) {
		this.classId = classId;
		this.className = className;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
}
