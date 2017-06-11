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
	/**
	 * 插入简历基本信息
	 * @param resumeBasic
	 */
	public void insertResume(ResumeBasic resumeBasic);
	
	/**
	 * 插入教育信息
	 * @param eductionExperience
	 */
	public void insertEductionExperience(EductionExperience eductionExperience);
	
	/**
	 * 插入工作经历
	 * @param workExperience
	 */
	public void insertWorkExperience(WorkExperience workExperience);
	
	/**
	 * 插入项目经历
	 * @param projectExperience
	 */
	public void insertProjectExperience(ProjectExperience projectExperience);
	/**
	 * 删除简历基本信息
	 * @param phonenumber
	 */
	public void deleteResume(String phonenumber);
	
	/**
	 * 删除教育经历
	 * @param phonenumber
	 */
	public void deleteEductionExperience(String phonenumber);
	/**
	 * 删除工作经历
	 * @param phonenumber
	 */
	public void deleteWorkExperience(String phonenumber);
	/**
	 * 删除项目经历
	 * @param phonenumber
	 */
	public void deleteProjectExperience(String phonenumber);
	/**
	 * 查询简历基本信息
	 * @param phonenumber
	 * @return
	 */
	public ResumeBasic selectResume(String phonenumber);
	/**
	 * 查询教育经历
	 * @param phonenumber
	 * @return
	 */
	public List<EductionExperience> selectEductionExperience(String phonenumber);
	/**
	 * 查询工作经历
	 * @param phonenumber
	 * @return
	 */
	public List<WorkExperience> selectWorkExperience(String phonenumber);
	/**
	 * 查询项目经历
	 * @param phonenumber
	 * @return
	 */
	public List<ProjectExperience> selectProjectExperience(String phonenumber);
	
	/**
	 * 通过工作年限和学历获得简历的基本信息(例如3到5年)
	 * @param workTime1
	 * @param workTime2
	 * @param degree
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<ResumeBasic> selectResumeBasicByWorkTimeAndDegree(int workTime1,int workTime2,int degree,int start,int pageSize);
	
	/**
	 * 通过工作年限和学历获得简历的基本信息(例如3到5年)的总条数
	 * @param workTime1
	 * @param workTime2
	 * @param degree
	 * @return
	 */
	public int selectResumeBasicByWorkTimeAndDegreeCount(int workTime1,int workTime2,int degree);
	
	/**
	 * 通过电话获得学历信息
	 * @param phonenumber
	 * @return
	 */
	public List<String> selectDegree(String phonenumber);
	
	/**
	 * 根据电话获取公司信息
	 * @param phonenumber
	 * @return
	 */
	public List<String> selectCompany(String phonenumber);
	
	
}
