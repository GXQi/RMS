package com.xupt.mahui.dao;

import java.util.List;

import com.xupt.mahui.entity.EductionExperience;
import com.xupt.mahui.entity.ProjectExperience;
import com.xupt.mahui.entity.ResumeBasic;
import com.xupt.mahui.entity.WorkExperience;

/**
 * 简历管理的dao层
 * @author mahui
 *
 */
public interface ResumeDao {
	public void insertResume(ResumeBasic resumeBasic);
	public void insertEductionExperience(EductionExperience eductionExperience);
	public void insertWorkExperience(WorkExperience workExperience);
	public void insertProjectExperience(ProjectExperience projectExperience);
	
	public void deleteResume(String phonenumber);
	public void deleteEductionExperience(String phonenumber);
	public void deleteWorkExperience(String phonenumber);
	public void deleteProjectExperience(String phonenumber);
	
	public ResumeBasic selectResume(String phonenumber);
	public List<EductionExperience> selectEductionExperience(String phonenumber);
	public List<WorkExperience> selectWorkExperience(String phonenumber);
	public List<ProjectExperience> selectProjectExperience(String phonenumber);
	
}
