package com.xupt.mahui.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.entity.EductionExperience;
import com.xupt.mahui.entity.ProjectExperience;
import com.xupt.mahui.entity.Resume;
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
	 * @return 基本信息
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
	 * @return 工作经历集合
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
	 * @return 项目经历集合
	 */
	public static List<ProjectExperience> getProjectExperiences(String phonenumber){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		return resumeDao.selectProjectExperience(phonenumber);
	}
	/**
	 * 通过phonenumber查询教育经历经历
	 * @param phonenumber
	 * @return 教育经历集合
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
	 * @return 是否添加成功
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
		resumeBasic.setEmail(basic.getString("3"));
		resumeBasic.setSkill(basic.getString("4"));
		resumeBasic.setWorkTime(basic.getString("5"));
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
	/**
	 * 根据工作年限和教育经历获取简历信息
	 * @param degree
	 * @param workTime
	 * @return
	 */
	public static List<Resume> getResume(String workTime,String degree){
		/**
		 * 1.先通过工作年限获得满足条件的人
		 * 2.在满足条件中的人获得满足学历要求的人
		 * 3.封装数据
		 */
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		List<ResumeBasic> list=resumeDao.selectResumeBasicByWorkTimeAndDegree(Integer.parseInt(workTime), Integer.parseInt(degree));
		System.out.println(""+list.size());
		List<Resume> resumeList=new ArrayList<>();
		for(int i=0;i<list.size();i++){
			System.out.println("执行了");
			List<String> degrees=resumeDao.selectDegree(list.get(i).getPhonenumber());
			List<String> companys=resumeDao.selectCompany(list.get(i).getPhonenumber());
			Resume resume=new Resume();
			resume.setName(list.get(i).getName());
			resume.setPhonenumber(list.get(i).getPhonenumber());
			resume.setSex(list.get(i).getSex());
			resume.setSkill(list.get(i).getSkill());
			resume.setWorkTime(list.get(i).getWorkTime());
			resume.setCompany(companys.get(0));
			resume.setDegree(getHighDegree(degrees));
			resumeList.add(resume);
		}
		
		return resumeList;	
	}
	
	
	/**
	 * 将字符串012转换为对应的学历信息
	 * @param string
	 * @return
	 */
	public static String changeDegree(String string){
		String[] degrees={"大专","本科","硕士","博士"};
		return degrees[Integer.parseInt(string)];
	}
	
	public static String getHighDegree(List<String> list){
		if(list.size()>0){
			int max=Integer.parseInt(list.get(0));
			for(int i=1;i<list.size();i++){
				if(max<Integer.parseInt(list.get(i))){
					max=Integer.parseInt(list.get(i));
				}
			}
			String[] degrees={"大专","本科","硕士","博士"};
			return degrees[max];
		}
		
		return "";
	}
}
