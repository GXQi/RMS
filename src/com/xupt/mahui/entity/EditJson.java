package com.xupt.mahui.entity;

import java.util.List;

/**
 * 点击编辑返回的json数据
 * @author mahui
 *
 */
public class EditJson {
	private ResumeBasic resumeBasic;
	private List<WorkExperience> workList;
	private List<EductionExperience> educList;
	private List<ProjectExperience> proList;
	public ResumeBasic getResumeBasic() {
		return resumeBasic;
	}
	public void setResumeBasic(ResumeBasic resumeBasic) {
		this.resumeBasic = resumeBasic;
	}
	public List<WorkExperience> getWorkList() {
		return workList;
	}
	public void setWorkList(List<WorkExperience> workList) {
		this.workList = workList;
	}
	public List<EductionExperience> getEducList() {
		return educList;
	}
	public void setEducList(List<EductionExperience> educList) {
		this.educList = educList;
	}
	public List<ProjectExperience> getProList() {
		return proList;
	}
	public void setProList(List<ProjectExperience> proList) {
		this.proList = proList;
	}
	
}
