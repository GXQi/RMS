package com.xupt.mahui.entity;

/**
 *  教育经历实体
 * @author mahui
 *
 */
public class EductionExperience {
	/**
	 * 应聘者电话
	 */
	private String phonenumber;
	/**
	 *	学校名称
	 */
	private String school;

	/**
	 * 学位
	 */
	private String degree;

	/**
	 * 专业
	 */
	private String major;

	/**
	 * 毕业年限
	 */
	private String graduationTime;

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getGraduationTime() {
		return graduationTime;
	}

	public void setGraduationTime(String graduationTime) {
		this.graduationTime = graduationTime;
	}
	

}
