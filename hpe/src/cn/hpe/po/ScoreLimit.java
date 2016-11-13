package cn.hpe.po;

public class ScoreLimit {
	private String subjectId;
	private String classId;
	private String limit="";
	private String order="";
	
	public ScoreLimit(){
		
	}
	
	public ScoreLimit(String subjectId, String classId, String limit, String order) {
		this.subjectId = subjectId;
		this.classId = classId;
		this.limit = limit;
		this.order=order;
	}


	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		if("0".equals(subjectId)){
			limit+="";
		}
		else{
			limit+=" and subjectId="+subjectId;
		}
		this.subjectId = subjectId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		if("-1".equals(classId)){
			limit+="";
		}
		else{
			limit+=" and classid="+classId;
		}
		this.classId = classId;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		if("0".equals(order)){
			this.order += " order by classid";
		}
		if("1".equals(order)){
			this.order += " order by score";
		}
		if("2".equals(order)){
			this.order += " order by score desc";
		}
	}
	
}
/*select t.subjectid,t.classid,avg(score),max(score),min(score) from (select em.subjectid,ci.classname,ci.classid,sm.score from scoremanage sm,exammanage em,student sd,classinfo ci
where sm.sno=sd.sno and sd.classid=ci.classid and sm.examno=em.examno)t group by t.classid,t.subjectid*/