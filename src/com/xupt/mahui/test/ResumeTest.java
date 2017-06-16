package com.xupt.mahui.test;

import org.apache.ibatis.session.SqlSession;
import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class ResumeTest {
	public static void main(String[] args) throws Exception{
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao = session.getMapper(ResumeDao.class);
		String phone="15829035667";
		resumeDao.deleteEductionExperience(phone);
		resumeDao.deleteProjectExperience(phone);
		resumeDao.deleteWorkExperience(phone);
		resumeDao.deleteResume(phone);
		System.out.println("删除成功");
	
	}

}
