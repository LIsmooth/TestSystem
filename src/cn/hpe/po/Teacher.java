package cn.hpe.po;

/**
 * 教师实体类
 * @author Administrator
 *
 */
public class Teacher {
	private String tno;		//教师编号
	private String tname;	//教师名字
	private String major;	//教师专业
	private String sex;		//教师性别
	private String tphone;	//教师电话
	private String tpwd;	//教师密码
	private String tidcard;	//教室身份证号

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
