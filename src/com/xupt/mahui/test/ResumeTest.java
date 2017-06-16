package com.xupt.mahui.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class ResumeTest {
	public static void main(String[] args) throws Exception{
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		ResumeDao employeeDao=session.getMapper(ResumeDao.class);
		employeeDao.deleteResumePath("15789023456");
		session.commit();
		System.out.println("删除成功");
	
	}

}
