package com.xupt.mahui.test;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class ResumeTest {

	@Test
	public void test() {
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao resumeDao=session.getMapper(ResumeDao.class);
		System.out.println(resumeDao.selectResumeBasicByWorkTimeAndDegree(1, 3, 1).size());
	}

}
