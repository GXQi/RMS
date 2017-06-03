package com.xupt.mahui.service;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.xupt.mahui.dao.EmployeeDao;
import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class LoginService {
	/**
	 *判断是否能够登录
	 * @param phonenumber
	 * @param password
	 * @return true(表示登陆成功),false(表示登录失败)
	 */
	public boolean isOk(String phonenumber,String password){
		SqlSessionFactory sessionFactory=SqlSessionFactoryUtil.getSqlSessionFactory();
		SqlSession session=sessionFactory.openSession();
		EmployeeDao employeeDao=session.getMapper(EmployeeDao.class);
		Employee employee=employeeDao.isLogin(phonenumber);
		if(employee==null)
			return false;
		if(password.equals(employee.getPassWord()))
			return true;
		return false;
	}
}
