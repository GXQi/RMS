package com.xupt.mahui.test;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class ResumeTest {

	public void test() {
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		System.out.println(resumeDao.selectResumeBasicByWorkTimeAndDegree(5, 10, 0).size());
	}

}
