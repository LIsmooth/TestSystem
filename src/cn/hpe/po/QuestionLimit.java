package cn.hpe.po;


public class QuestionLimit {
	private String subject_id;
	private String question_type;
	private String level_type;
	private int begin_section=0;
	private int end_section;
	private String limit="";
	
	
	public QuestionLimit(){
		
	}

	public QuestionLimit(String subject_id, String question_type,
			String level_type, int begin_section, int end_section, String limit) {
		this.subject_id = subject_id;
		this.question_type = question_type;
		this.level_type = level_type;
		this.begin_section = begin_section;
		this.end_section = end_section;
		this.limit = limit;
	}

	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		if(subject_id.equals("0")){
			limit+="";
		}
		else{
			limit+=" and subjectid ="+subject_id;
		}
		
		this.subject_id = subject_id;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		if(question_type.equals("0")){
			limit+="";
		}
		if(question_type.equals("1")){
			limit+=" and ismultiple = 1";
		}
		if(question_type.equals("2")){
			limit+=" and ismultiple = 2";
		}
		if(question_type.equals("3")){
			limit+=" and isessay = 3";
		}
		if(question_type.equals("4")){
			limit+=" and isessay = 4";
		}
		this.question_type = question_type;
	}
	public String getLevel_type() {
		return level_type;
	}
	public void setLevel_type(String level_type) {
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
		this.level_type = level_type;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	
	public int getBegin_section() {
		return begin_section;
	}

	public void setBegin_section(int begin_section) {
		limit+=" and sectionid>="+begin_section;
		this.begin_section = begin_section;
	}

	public int getEnd_section() {
		return end_section;
	}

	public void setEnd_section(int end_section) {
		if(end_section==0){
			limit+="";
		}
		else{
			limit+=" and sectionid<="+end_section;
		}
		this.end_section = end_section;
	}
}
