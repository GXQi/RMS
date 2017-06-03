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
	private String incumbency;
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
	
	public String getIncumbency() {
		return incumbency;
	}
	public void setIncumbency(String incumbency) {
		this.incumbency = incumbency;
	}
	public String getWorkContent() {
		return workContent;
	}
	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}
	
	
}
