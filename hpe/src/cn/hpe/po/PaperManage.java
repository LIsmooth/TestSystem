package cn.hpe.po;

public class PaperManage {
	private int examNo; 			//���Ա��
	private String paperNo;			//�Ծ���
	private String paperName;		//�Ծ�����
	private String subjectId;		//���Կ�Ŀ
	private String teaName;			//��ʦ����
	private String examTime;		//��������
	private String totalTime;		//����ʱ��
	private String classList;		//�Ծ���Ӧ�༶
	private int examStatus;			//����״̬ 0:���Ըշ���;1:��ʼ���� ;2:���Խ���
	private int isStudentExam;      //ѧ���Ƿ���
	

	public PaperManage() {
		
	}

	

	public PaperManage(int examNo, String paperNo, String paperName,
			String subjectId, String teaName, String examTime,
			String totalTime, String classList, int examStatus,
			int isStudentExam) {
		this.examNo = examNo;
		this.paperNo = paperNo;
		this.paperName = paperName;
		this.subjectId = subjectId;
		this.teaName = teaName;
		this.examTime = examTime;
		this.totalTime = totalTime;
		this.classList = classList;
		this.examStatus = examStatus;
		this.isStudentExam = isStudentExam;
	}



	public int getExamStatus() {
		return examStatus;
	}



	public void setExamStatus(int examStatus) {
		this.examStatus = examStatus;
	}



	public int getIsStudentExam() {
		return isStudentExam;
	}

	public void setIsStudentExam(int isStudentExam) {
		this.isStudentExam = isStudentExam;
	}

	public int getExamNo() {
		return examNo;
	}

	public void setExamNo(int examNo) {
		this.examNo = examNo;
	}

	public String getPaperNo() {
		return paperNo;
	}

	public void setPaperNo(String paperNo) {
		this.paperNo = paperNo;
	}

	public String getPaperName() {
		return paperName;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public String getTeaName() {
		return teaName;
	}

	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public String getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

	public String getClassList() {
		return classList;
	}

	public void setClassList(String classList) {
		this.classList = classList;
	}
	
	
}
