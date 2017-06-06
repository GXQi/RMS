package com.xupt.mahui.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.entity.EductionExperience;
import com.xupt.mahui.entity.ProjectExperience;
import com.xupt.mahui.entity.ResumeBasic;
import com.xupt.mahui.entity.WorkExperience;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

/**
 * 简历管理相关的业务逻辑层的处理
 * @author mahui
 *
 */

public class ResumeManageService {
	/**
	 * 通过电话查询基本信息
	 * @param phonenumber
	 * @return
	 */
	public static ResumeBasic getResumeBasic(String phonenumber){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		return resumeDao.selectResume(phonenumber);	
	}
	/**
	 * 通过phonenumber查询工作经历
	 * @param phonenumber
	 * @return
	 */
	public static List<WorkExperience> getWorkExperiences(String phonenumber){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		return resumeDao.selectWorkExperience(phonenumber);
	}
	/**
	 * 通过phonenumber查询项目经历
	 * @param phonenumber
	 * @return
	 */
	public static List<ProjectExperience> getWProjectExperiences(String phonenumber){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		return resumeDao.selectProjectExperience(phonenumber);
	}
	/**
	 * 通过phonenumber查询教育经历经历
	 * @param phonenumber
	 * @return
	 */
	public static List<EductionExperience> getEductionExperiences(String phonenumber){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		return resumeDao.selectEductionExperience(phonenumber);
	}
}
