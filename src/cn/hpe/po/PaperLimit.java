package cn.hpe.po;

public class PaperLimit {
	
	private String subject_id;
	private String level_type;
	private int begin_section=0;
	private int end_section;
	private String tno;
	private String limit="";
	
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
		if(subject_id.equals("0")){
			limit+="";
		}
		else{
			limit+=" and subjectid ="+subject_id;
		}
	}
	public String getLevel_type() {
		return level_type;
	}
	public void setLevel_type(String level_type) {
		this.level_type = level_type;
		if(level_type.equals("0")){
			limit+="";
		}
		if(level_type.equals("1")){
			limit+=" and questionlevel = 1";
		}
		if(level_type.equals("2")){
			limit+=" and questionlevel = 2";
		}
		if(level_type.equals("3")){
			limit+=" and questionlevel = 3";
		}
	}
	public int getBegin_section() {
		return begin_section;
	}
	public void setBegin_section(int begin_section) {
		this.begin_section = begin_section;
		limit+=" and sectionid>="+begin_section;
	}
	public int getEnd_section() {
		return end_section;
	}
	public void setEnd_section(int end_section) {
		this.end_section = end_section;
		if(end_section==0){
			limit+="";
		}
		else{
			limit+=" and sectionid<="+end_section;
		}
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
		limit+=" and tno='"+tno+"'";
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
}
