package com.xupt.mahui.service;

import org.apache.ibatis.session.SqlSession;
import com.xupt.mahui.dao.EmployeeDao;
import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class EmployeeManageService {
	/*注册一个用户*/
	public static boolean registerAnEmployee(Employee employee) {
		Employee employeeTemp = null;
		String phoneNumberTemp = employee.getPhoneNumber();//获取用户电话号码
		/*连接数据库*/
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		EmployeeDao employeeDao = session.getMapper(EmployeeDao.class);
		/*查询用户是否在数据库中已存在*/
		employeeTemp = employeeDao.isLogin(phoneNumberTemp);
		if (employeeTemp != null
				&& employeeTemp.getPhoneNumber().equals(employee.getPhoneNumber())) {
			// 用户已注册过了
			session.close();//释放数据库连接
			return false;//返回注册失败
		}
		employeeDao.insertAnEmployee(employee);//将用户数据写入employee表
		session.commit();//提交数据
		session.close();//释放数据库连接
		return true;//返回注册成功
	}
	/*登录时验证用户是否为合法用户*/
	public static boolean canAnEmployeeLogin(Employee employee) {
		Employee employeeTemp = null;
		String phoneNumberTemp = employee.getPhoneNumber();//获取用户电话号码
		/*连接数据库*/
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		EmployeeDao employeeDao = session.getMapper(EmployeeDao.class);
		/*查询用户是否在数据库中已存在*/
		employeeTemp = employeeDao.isLogin(phoneNumberTemp);
		if (employeeTemp != null 
				&& employeeTemp.getPhoneNumber().equals(employee.getPhoneNumber())
				&& employeeTemp.getPassWord().equals(employee.getPassWord())) {
			// 用户已注册过了
			session.close();//释放数据库连接
			return true;//返回用户合法，允许登录
		}
		session.close();//释放数据库连接
		return false;//返回用户不合法，不允许登录
	}
	/*修改一个用户的密码*/
	public static boolean resetAnEmployeePassword(Employee employee) {
		Employee employeeTemp = null;
		String phoneNumberTemp = employee.getPhoneNumber();//获取用户电话号码
		/*连接数据库*/
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		EmployeeDao employeeDao = session.getMapper(EmployeeDao.class);
		/*查询用户是否在数据库中已存在*/
		employeeTemp = employeeDao.isLogin(phoneNumberTemp);
		if (employeeTemp != null
				&& employeeTemp.getPhoneNumber().equals(employee.getPhoneNumber())) {
			// 用户已注册过了
			employeeDao.ResteAnEmployeePassword(employee);
			session.close();//释放数据库连接
			return true;//返回修改成功
		}
		session.close();//释放数据库连接
		return false;//返回用户不合法，不允许修改密码
	}
}
