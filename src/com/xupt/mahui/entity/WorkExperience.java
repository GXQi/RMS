package com.xupt.mahui.entity;

/**
 * 工作经历实体
 * @author mahui
 *
 */
public class WorkExperience {
	/**
	 * 应聘者电话
	 */
	private String phonenumber;
	/**
	 * 公司
	 */
	private String company;
	/**
	 * 职位
	 */
	private String position;
	/**
	 * 在职时间
	 */
	private String workTimeStart;
	/**
	 * 在职时间
	 */
	private String workTimeEnd;
	/**
	 * 工作内容
	 */
	private String workContent;
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWorkTimeStart() {
		return workTimeStart;
	}
	public void setWorkTimeStart(String workTimeStart) {
		this.workTimeStart = workTimeStart;
	}
	public String getWorkTimeEnd() {
		return workTimeEnd;
	}
	public void setWorkTimeEnd(String workTimeEnd) {
		this.workTimeEnd = workTimeEnd;
	}
	public String getWorkContent() {
		return workContent;
	}
	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}
	
	
}
