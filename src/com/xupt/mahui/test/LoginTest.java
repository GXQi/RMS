package com.xupt.mahui.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.xupt.mahui.dao.EmployeeDao;
import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class LoginTest {
	public static void main(String[] args){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		EmployeeDao employeeDao=session.getMapper(EmployeeDao.class);
		Employee employee=employeeDao.isLogin("17629034550");
		System.out.println(employee.getPhoneNumber()+" "+employee.getNickName());
	
	}
}
