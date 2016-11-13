package cn.hpe.po;

/**
 * 学生实体类
 * @author Administrator
 *
 */
public class Student {
	private String sno;		//学生学号
	private String sname;	//学生姓名
	private String major;	//学生专业
	private String classid;	//班级编号
	private String sphone;	//学生电话
	private String spwd;	//学生密码
	private String sidcard;	//学生身份证号
	private String sex;		//学生性别

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
