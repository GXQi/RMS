package com.xupt.mahui.service;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.entity.ResumeBasic;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class ResumeManageService {
	public boolean delete(String phonenumber){
		SqlSessionFactory sessionFactory=null;
		SqlSession session=null;
		try{
			sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
			session=sessionFactory.openSession();
			ResumeDao resumeDao=session.getMapper(ResumeDao.class);
			
			resumeDao.deleteProjectExperience(phonenumber);
			resumeDao.deleteEductionExperience(phonenumber);
			resumeDao.deleteWorkExperience(phonenumber);
			resumeDao.deleteResume(phonenumber);
			session.commit();
			return true;
			
			
		}catch(Exception e){
			
		}finally{
			session.close();
		}
		return false;
	}
	
	public ResumeBasic select(){
		SqlSessionFactory sessionFactory=null;
		SqlSession session=null;
		sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		session.close();
		return resumeDao.selectResume("17629034550");	
		
	}
}
