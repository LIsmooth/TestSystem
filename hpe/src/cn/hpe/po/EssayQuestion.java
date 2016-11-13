package cn.hpe.po;

/**
 * 问答题实体类
 * @author Administrator
 *
 */
public class EssayQuestion {
	private int questionno;	//问题编号
	private int inpaperno;		//在试卷中的题号
	private String subjectid;	//课程编号
	private int sectionid;		//章节
	private String question;	//题目
	private String rightanswer;	//正确答案
	private int questionlevel;	//难度等级
	private int questionmark;	//分值
	private int isessay;		//问答题or编程题  问答题:3   编程题:4

	public EssayQuestion() {

	}

	


	public EssayQuestion(int questionno, String subjectid, int sectionid,
			String question, String rightanswer, int questionlevel,
			int questionmark, int isessay) {
		this.questionno = questionno;
		this.subjectid = subjectid;
		this.sectionid = sectionid;
		this.question = question;
		this.rightanswer = rightanswer;
		this.questionlevel = questionlevel;
		this.questionmark = questionmark;
		this.isessay = isessay;
	}




	public int getIsessay() {
		return isessay;
	}



	public void setIsessay(int isessay) {
		this.isessay = isessay;
	}



	public int getSectionid() {
		return sectionid;
	}




	public void setSectionid(int sectionid) {
		this.sectionid = sectionid;
	}




	public String getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}

	public int getQuestionno() {
		return questionno;
	}

	public void setQuestionno(int questionno) {
		this.questionno = questionno;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
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




	public int getInpaperno() {
		return inpaperno;
	}




	public void setInpaperno(int inpaperno) {
		this.inpaperno = inpaperno;
	}
}
