package com.xupt.mahui.entity;

/**
 * 简历项目经历实体
 * @author mahui
 *
 */
public class ProjectExperience {
	/**
	 * 应聘者电话
	 */
	private String phonenumber;
	/**
	 * 项目名称
	 */
	private String projectName;
	/**
	 * 角色
	 */
	private String projectRole;
	/**
	 * 项目开始时间
	 */
	private String projectTimeStart;
	/**
	 * 项目结束时间
	 */
	private String projectTimeEnd;
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
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectRole() {
		return projectRole;
	}
	public void setProjectRole(String projectRole) {
		this.projectRole = projectRole;
	}
	public String getWorkContent() {
		return workContent;
	}
	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}
	public String getProjectTimeStart() {
		return projectTimeStart;
	}
	public void setProjectTimeStart(String projectTimeStart) {
		this.projectTimeStart = projectTimeStart;
	}
	public String getProjectTimeEnd() {
		return projectTimeEnd;
	}
	public void setProjectTimeEnd(String projectTimeEnd) {
		this.projectTimeEnd = projectTimeEnd;
	}
	
	
	

}
