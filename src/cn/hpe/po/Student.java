package cn.hpe.po;

/**
 * ѧ��ʵ����
 * @author Administrator
 *
 */
public class Student {
	private String sno;		//ѧ��ѧ��
	private String sname;	//ѧ������
	private String major;	//ѧ��רҵ
	private String classid;	//�༶���
	private String sphone;	//ѧ���绰
	private String spwd;	//ѧ������
	private String sidcard;	//ѧ�����֤��
	private String sex;		//ѧ���Ա�

	public Student() {

	}

	public Student(String sno, String sname, String major, String classid,
			String sphone, String spwd, String sidcard, String sex) {
		this.sno = sno;
		this.sname = sname;
		this.major = major;
		this.classid = classid;
		this.sphone = sphone;
		this.spwd = spwd;
		this.sidcard = sidcard;
		this.sex = sex;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSpwd() {
		return spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	public String getSidcard() {
		return sidcard;
	}

	public void setSidcard(String sidcard) {
		this.sidcard = sidcard;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

}
