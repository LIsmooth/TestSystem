package cn.hpe.po;

/**
 * 选择题实体类
 * @author Administrator
 *
 */
public class MultiQuestion {
	private int questionno;		//问题编号
	private int inpaperno;			//在试卷中的题号
	private String subjectid;	//课程编号
	private int sectionid;		//章节
	private String question;	//题目
	private String questionA;	//答案A
	private String questionB;	//答案B
	private String questionC;	//答案C
	private String questionD;	//答案D
	private String rightanswer;	//正确答案
	private int questionlevel;	//难度等级
	private int questionmark;	//分值
	private int ismultiple;		//是否是多选
	
	
	

	public MultiQuestion(){
		
	}

	public MultiQuestion(int questionno, String subjectid, int sectionid,
			String question, String questionA, String questionB,
			String questionC, String questionD, String rightanswer,
			int questionlevel, int questionmark, int ismultiple) {
		this.questionno = questionno;
		this.subjectid = subjectid;
		this.sectionid = sectionid;
		this.question = question;
		this.questionA = questionA;
		this.questionB = questionB;
		this.questionC = questionC;
		this.questionD = questionD;
		this.rightanswer = rightanswer;
		this.questionlevel = questionlevel;
		this.questionmark = questionmark;
		this.ismultiple = ismultiple;
	}




	public int getQuestionno() {
		return questionno;
	}
	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}
	public String getSubjectid() {
		return subjectid;
	}
	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}
	
	public int getSectionid() {
		return sectionid;
	}


	public void setSectionid(int sectionid) {
		this.sectionid = sectionid;
	}


	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionA() {
		return questionA;
	}
	public void setQuestionA(String questionA) {
		this.questionA = questionA;
	}
	public String getQuestionB() {
		return questionB;
	}
	public void setQuestionB(String questionB) {
		this.questionB = questionB;
	}
	public String getQuestionC() {
		return questionC;
	}
	public void setQuestionC(String questionC) {
		this.questionC = questionC;
	}
	public String getQuestionD() {
		return questionD;
	}
	public void setQuestionD(String questionD) {
		this.questionD = questionD;
	}
	public String getRightanswer() {
		return rightanswer;
	}
	public void setRightanswer(String rightanswer) {
		this.rightanswer = rightanswer;
	}
	public int getQuestionlevel() {
		return questionlevel;
	}
	public void setQuestionlevel(int questionlevel) {
		this.questionlevel = questionlevel;
	}
	public int getQuestionmark() {
		return questionmark;
	}
	public void setQuestionmark(int questionmark) {
		this.questionmark = questionmark;
	}
	public int getIsmultiple() {
		return ismultiple;
	}

	public void setIsmultiple(int ismultiple) {
		this.ismultiple = ismultiple;
	}

	public int getInpaperno() {
		return inpaperno;
	}

	public void setInpaperno(int inpaperno) {
		this.inpaperno = inpaperno;
	}

	
}
