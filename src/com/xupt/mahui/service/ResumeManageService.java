package com.xupt.mahui.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
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
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		ResumeBasic list=resumeDao.selectResume(phonenumber);	
		session.commit();
		session.close();
		return list;
	}
	/**
	 * 通过phonenumber查询工作经历
	 * @param phonenumber
	 * @return 工作经历集合
	 */
	public static List<WorkExperience> getWorkExperiences(String phonenumber){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		List<WorkExperience> list=resumeDao.selectWorkExperience(phonenumber);
		session.commit();
		session.close();
		return list;
	}
	/**
	 * 通过phonenumber查询项目经历
	 * @param phonenumber
	 * @return 项目经历集合
	 */
	public static List<ProjectExperience> getProjectExperiences(String phonenumber){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		List<ProjectExperience> list=resumeDao.selectProjectExperience(phonenumber);
		session.commit();
		session.close();
		return list;
	}
	/**
	 * 通过phonenumber查询教育经历经历
	 * @param phonenumber
	 * @return 教育经历集合
	 */
	public static List<EductionExperience> getEductionExperiences(String phonenumber){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		List<EductionExperience> list= resumeDao.selectEductionExperience(phonenumber);
		session.commit();	
		session.close();
		return list;
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
		String prephone = jsonObject.getString("prephone");
		String flag = jsonObject.getString("flag");
		String path=null;
		String phoenumber=null;
		System.out.println(data);
		/**
		 * 解析建立基本信息并封装成对象
		 */
		ResumeBasic resumeBasic=new ResumeBasic();
		resumeBasic.setName(basic.getString("0"));
		phoenumber=basic.getString("1");
		resumeBasic.setPhonenumber(phoenumber);
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
			workExperience.setWorkTimeStart(work.getString(workKey.next()));
			workExperience.setWorkTimeEnd(work.getString(workKey.next()));
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
			projectExperience.setProjectTimeStart(project.getString(projectKey.next()));
			projectExperience.setProjectTimeEnd(project.getString(projectKey.next()));
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
			eductionExperience.setDegree(""+changeDegreeToNumber(edu.getString(eduKey.next())));
			eductionExperience.setGraduationTime(edu.getString(eduKey.next()));
			eductionExperience.setPhonenumber(resumeBasic.getPhonenumber());
			eduList.add(eductionExperience);
		}
		if(flag.equals("1")){
			//说明改变电话号码了
			path=ResumeManageService.getResumePath(prephone);
			if(path!=null)
				ResumeManageService.deleteResumePath(prephone);
			ResumeClearService.ClearAllDataFromPhoneNumber(prephone);
		}
		/**
		 * 将数据添加到数据库
		 */
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		try {
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
			if(flag.equals("1")){
				if(path!=null){
					ResumeManageService.insertResumePath(phoenumber, path);	
				}
			}
			
			return true;
		}catch(Exception e){
			System.out.println("插入的数据出异常啦");
			System.out.println("异常信息是"+e.getMessage());
		}finally{
			session.close();
		}
		return false;
	}
	/**
	 * 根据工作年限和教育经历获取简历信息
	 * @param workTime
	 * @param degree
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public static List<Resume> getResume(String workTime,String degree,int start,int pageSize){
		/**
		 * 1.先通过工作年限获得满足条件的人
		 * 2.在满足条件中的人获得满足学历要求的人
		 * 3.封装数据
		 */
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		List<ResumeBasic> list=new ArrayList<>();
		switch(Integer.parseInt(workTime)){
			case -1:
				//不限
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(0, Integer.MAX_VALUE,Integer.parseInt(degree),start,pageSize);
				break;
			case 0:
				//应届
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(0,0,Integer.parseInt(degree),start,pageSize);
				break;
			case 1:
				//一年以下
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(0,1,Integer.parseInt(degree),start,pageSize);
				break;
			case 2:
				//1到3年
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(1,3,Integer.parseInt(degree),start,pageSize);
				break;
			case 3:
				//3到5年
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(3,5,Integer.parseInt(degree),start,pageSize);
				break;
			case 4:
				//5到10年
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(5,10,Integer.parseInt(degree),start,pageSize);
				break;
			case 5:
				//10年以上
				list=resumeDao.selectResumeBasicByWorkTimeAndDegree(10,Integer.MAX_VALUE,Integer.parseInt(degree),start,pageSize);
				break;
		}
		List<Resume> resumeList=new ArrayList<>();
		for(int i=0;i<list.size();i++){
			List<String> degrees=resumeDao.selectDegree(list.get(i).getPhonenumber());
			List<String> companys=resumeDao.selectCompany(list.get(i).getPhonenumber());
			Resume resume=new Resume();
			resume.setName(list.get(i).getName());
			resume.setPhonenumber(list.get(i).getPhonenumber());
			resume.setSex(list.get(i).getSex());
			resume.setSkill(list.get(i).getSkill());
			resume.setWorkTime(list.get(i).getWorkTime());
			resume.setCompany(companys.get(0));
			resume.setEmail(list.get(i).getEmail());
			resume.setDegree(getHighDegree(degrees));
			resumeList.add(resume);
		}
		session.commit();
		session.close();
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
	
	/**
	 * 将字符串对应的学历信息012
	 * @param string
	 * @return
	 */
	public static int changeDegreeToNumber(String string){
		String[] degrees={"大专","本科","硕士","博士"};
		for(int i=0;i<degrees.length;i++){
			if(string.equals(degrees[i]))
				return  i;
		}
		return 0;
	}
	/**
	 * 获得最高学位
	 * @param list
	 * @return
	 */
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
	/**
	 * 根据工作年限和教育经历获取简历信息总条数
	 * @param workTime
	 * @param degree
	 * @return
	 */
	public static int getResumeCount(String workTime,String degree){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		int count=0;
		switch(Integer.parseInt(workTime)){
		case -1:
			//不限
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(0, Integer.MAX_VALUE,Integer.parseInt(degree));
			break;
		case 0:
			//应届
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(0,0,Integer.parseInt(degree));
			break;
		case 1:
			//一年以下
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(0,1,Integer.parseInt(degree));
			break;
		case 2:
			//1到3年
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(1,3,Integer.parseInt(degree));
			break;
		case 3:
			//3到5年
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(3,5,Integer.parseInt(degree));
			break;
		case 4:
			//5到10年
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(5,10,Integer.parseInt(degree));
			break;
		case 5:
			//10年以上
			count=resumeDao.selectResumeBasicByWorkTimeAndDegreeCount(10,Integer.MAX_VALUE,Integer.parseInt(degree));
			break;
		}
		session.commit();	
		session.close();
		return count;
	}
	
	/**
	 * 通过工作技能查询简历信息
	 * @param skill
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Resume> getResumeBySkill(String skill,int start,int pageSize){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		List<ResumeBasic> list=resumeDao.selectResumeBySkill("%"+skill+"%",start,pageSize);
		List<Resume> resumeList=new ArrayList<>();
		for(int i=0;i<list.size();i++){
			List<String> degrees=resumeDao.selectDegree(list.get(i).getPhonenumber());
			List<String> companys=resumeDao.selectCompany(list.get(i).getPhonenumber());
			Resume resume=new Resume();
			resume.setName(list.get(i).getName());
			resume.setPhonenumber(list.get(i).getPhonenumber());
			resume.setSex(list.get(i).getSex());
			resume.setSkill(list.get(i).getSkill());
			resume.setWorkTime(list.get(i).getWorkTime());
			resume.setCompany(companys.get(0));
			resume.setEmail(list.get(i).getEmail());
			resume.setDegree(getHighDegree(degrees));
			resumeList.add(resume);
		}
		session.commit();	
		session.close();
		return resumeList;
	}
	/**
	 * 通过工作技能获得条数
	 * @param skill
	 * @return
	 */
	public int getResumeCountBySkill(String skill){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		int count=resumeDao.selectResumeCountBySkill(skill);
		session.commit();	
		session.close();
		return count;
	}
	/**
	 * 将简历的路径保存在数据库中
	 * @param phonenumber
	 * @param path
	 * @return
	 */
	public static boolean insertResumePath(String phonenumber,String path){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		try{
			ResumeDao resumeDao=session.getMapper(ResumeDao.class);
			resumeDao.insertResumePath(phonenumber, path);
			session.commit();
			
			return true;
		}catch(Exception e){
			System.out.println("插入的数据出异常啦");
			System.out.println("异常信息是"+e.getMessage());
		}finally{
			session.close();
		}
		return false;
	}
	/**
	 * 查询简历的路径
	 * @param phonenumber
	 * @return
	 */
	public static String getResumePath(String phonenumber){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		String path=resumeDao.selectResumePath(phonenumber);
		session.commit();
		session.close();
		return path;
	}
	
	/**
	 * 查询简历的路径
	 * @param phonenumber
	 * @return
	 */
	public static void deleteResumePath(String phonenumber){
		SqlSession session=SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		resumeDao.deleteResumePath(phonenumber);
		session.commit();
		session.close();
	}
}
