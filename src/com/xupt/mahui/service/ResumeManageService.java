package com.xupt.mahui.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.entity.EductionExperience;
import com.xupt.mahui.entity.ProjectExperience;
import com.xupt.mahui.entity.ResumeBasic;
import com.xupt.mahui.entity.WorkExperience;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

import net.sf.json.JSONObject;

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
	/**
	 * 向数据库添加简历信息
	 * @param data
	 * @return
	 */
	public static boolean insert(String data){
		JSONObject jsonObject=JSONObject.fromObject(data);
		JSONObject basic=jsonObject.getJSONObject("basic");
		JSONObject work=jsonObject.getJSONObject("work");
		JSONObject project=jsonObject.getJSONObject("project");
		JSONObject edu=jsonObject.getJSONObject("edu");
		/**
		 * 解析建立基本信息并封装成对象
		 */
		ResumeBasic resumeBasic=new ResumeBasic();
		resumeBasic.setName(basic.getString("0"));
		resumeBasic.setPhonenumber(basic.getString("1"));
		resumeBasic.setSex(basic.getString("2"));
		resumeBasic.setEmail(basic.getString("4"));
		resumeBasic.setSkill(basic.getString("5"));
		resumeBasic.setWorkTime(basic.getString("6"));
		/**
		 * 解析工作经历并封装成list对象
		 */
		@SuppressWarnings("unchecked")
		Iterator<String> workKey=work.keys();
		List<WorkExperience> workList=new ArrayList<>();
		while(workKey.hasNext()){
			WorkExperience workExperience=new WorkExperience();
			workExperience.setCompany(work.getString(workKey.next()));
			workExperience.setPosition(work.getString(workKey.next()));
			workExperience.setIncumbency(work.getString(workKey.next())+"至"+work.getString(workKey.next()));
			workExperience.setWorkContent(work.getString(workKey.next()));
			workExperience.setPhonenumber(resumeBasic.getPhonenumber());
			workList.add(workExperience);
		}
		/**
		 * 解析项目经历并封装成项目经历
		 */
		@SuppressWarnings("unchecked")
		Iterator<String> projectKey=project.keys();
		List<ProjectExperience> projectList=new ArrayList<>();
		while(projectKey.hasNext()){
			ProjectExperience projectExperience=new ProjectExperience();
			projectExperience.setProjectName(project.getString(projectKey.next()));
			projectExperience.setProjectRole(project.getString(projectKey.next()));
			projectExperience.setProjectTime(project.getString(projectKey.next())+"至"+project.getString(projectKey.next()));
			projectExperience.setWorkContent(project.getString(projectKey.next()));
			projectExperience.setPhonenumber(resumeBasic.getPhonenumber());
			projectList.add(projectExperience);
		}
		/**
		 * 解析教育经历并封装成list对象
		 */
		@SuppressWarnings("unchecked")
		Iterator<String> eduKey=edu.keys();
		List<EductionExperience> eduList=new ArrayList<>();
		while(eduKey.hasNext()){
			EductionExperience eductionExperience=new EductionExperience();
			eductionExperience.setSchool(edu.getString(eduKey.next()));
			eductionExperience.setMajor(edu.getString(eduKey.next()));
			eductionExperience.setDegree(edu.getString(eduKey.next()));
			eductionExperience.setGraduationTime(edu.getString(eduKey.next()));
			eductionExperience.setPhonenumber(resumeBasic.getPhonenumber());
			eduList.add(eductionExperience);
		}
		/**
		 * 将数据添加到数据库
		 */
		try {
			SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
			SqlSession session=sessionFactory.openSession();
			ResumeDao resumeDao=session.getMapper(ResumeDao.class);
			resumeDao.insertResume(resumeBasic);
			for(int i=0;i<workList.size();i++){
				resumeDao.insertWorkExperience(workList.get(i));
			}
			for(int i=0;i<projectList.size();i++){
				resumeDao.insertProjectExperience(projectList.get(i));
			}
			for(int i=0;i<eduList.size();i++){
				resumeDao.insertEductionExperience(eduList.get(i));
			}
			session.commit();
			return true;
		}catch(Exception e){
			System.out.println("插入的数据出异常啦");
			System.out.println("异常信息是"+e.getMessage());
		}
		return false;
	}
}
