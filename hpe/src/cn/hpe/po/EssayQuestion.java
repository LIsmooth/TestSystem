package cn.hpe.po;

/**
 * �ʴ���ʵ����
 * @author Administrator
 *
 */
public class EssayQuestion {
	private int questionno;	//������
	private int inpaperno;		//���Ծ��е����
	private String subjectid;	//�γ̱��
	private int sectionid;		//�½�
	private String question;	//��Ŀ
	private String rightanswer;	//��ȷ��
	private int questionlevel;	//�Ѷȵȼ�
	private int questionmark;	//��ֵ
	private int isessay;		//�ʴ���or�����  �ʴ���:3   �����:4

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
