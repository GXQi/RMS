package com.xupt.mahui.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;
import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.entity.EductionExperience;
import com.xupt.mahui.entity.ProjectExperience;
import com.xupt.mahui.entity.ResumeBasic;
import com.xupt.mahui.entity.WorkExperience;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class ResumeTest {
	public static void main(String[] args){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		ResumeBasic resumeBasic=new ResumeBasic();
		resumeBasic.setPhonenumber("17629034550");
		resumeBasic.setEmail("ismahui@163.com");
		resumeBasic.setName("马辉");
		resumeBasic.setSex("男");
		resumeBasic.setSkill("android");
		resumeBasic.setWorkTime("0");
		EductionExperience eductionExperience=new EductionExperience();
		eductionExperience.setPhonenumber(resumeBasic.getPhonenumber());
		eductionExperience.setDegree("本科");
		eductionExperience.setGraduationTime("2018-07");
		eductionExperience.setMajor("软件工程");
		eductionExperience.setSchool("西安邮电大学");
		ProjectExperience projectExperience=new ProjectExperience();
		projectExperience .setPhonenumber(resumeBasic.getPhonenumber());
		projectExperience.setProjectName("智能停车场项目");
		projectExperience.setProjectRole("安卓负责人");
		projectExperience.setProjectTime("2016-10~2016-12");
		projectExperience.setWorkContent("content");
		WorkExperience workExperience=new WorkExperience();
		workExperience.setCompany("xx有限公司");
		workExperience.setPhonenumber(resumeBasic.getPhonenumber());
		workExperience.setIncumbency("2");
		workExperience.setPosition("安卓开发工程师");
		workExperience.setWorkContent("content");
		resumeDao.insertResume(resumeBasic);
		resumeDao.insertEductionExperience(eductionExperience);
		resumeDao.insertProjectExperience(projectExperience);
		resumeDao.insertWorkExperience(workExperience);
//		resumeDao.deleteWorkExperience("17629034550");
//		resumeDao.deleteProjectExperience("17629034550");
//		resumeDao.deleteEductionExperience("17629034550");
//		resumeDao.deleteResume("17629034550");
		List<ProjectExperience> list=resumeDao.selectProjectExperience("17629034550");
		List<WorkExperience> list1=resumeDao.selectWorkExperience("17629034550");
		List<EductionExperience> list2=resumeDao.selectEductionExperience("17629034550");
		ResumeBasic resumeBasic2=resumeDao.selectResume("17629034550");
		session.commit();
		System.out.println(new Gson().toJson(resumeBasic2));
		System.out.println(new Gson().toJson(list));
		System.out.println(new Gson().toJson(list1));
		System.out.println(new Gson().toJson(list2));
	
	}
}
