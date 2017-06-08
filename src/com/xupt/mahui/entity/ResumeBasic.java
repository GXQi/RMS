package com.xupt.mahui.entity;
/**
 * 简历基本信息实体
 * @author mahui
 *
 */
public class ResumeBasic {
	/**
	 * 应聘者电话
	 */
	private String phonenumber;
	/**
	 * 应聘者姓名
	 */
	private String name;
	/**
	 * 应聘者性别
	 */
	private String sex;
	/**
	 * 应聘者邮箱
	 */
	private String email;
	 /**
	  * 应聘者技能
	  */
	private String skill;
	/**
	 * 工作年限
	 */
	private String workTime;
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	
}
