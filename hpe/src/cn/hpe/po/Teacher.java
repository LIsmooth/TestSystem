package cn.hpe.po;

/**
 * ��ʦʵ����
 * @author Administrator
 *
 */
public class Teacher {
	private String tno;		//��ʦ���
	private String tname;	//��ʦ����
	private String major;	//��ʦרҵ
	private String sex;		//��ʦ�Ա�
	private String tphone;	//��ʦ�绰
	private String tpwd;	//��ʦ����
	private String tidcard;	//�������֤��

	public Teacher() {

	}

	public Teacher(String tno, String tname, String major, String sex,
			String tphone, String tpwd, String tidcard) {
		this.tno = tno;
		this.tname = tname;
		this.major = major;
		this.sex = sex;
		this.tphone = tphone;
		this.tpwd = tpwd;
		this.tidcard = tidcard;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTphone() {
		return tphone;
	}

	public void setTphone(String tphone) {
		this.tphone = tphone;
	}

	public String getTpwd() {
		return tpwd;
	}

	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
	}

	public String getTidcard() {
		return tidcard;
	}

	public void setTidcard(String tidcard) {
		this.tidcard = tidcard;
	}

}
