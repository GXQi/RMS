package com.xupt.mahui.service;

import org.apache.ibatis.session.SqlSession;
import com.xupt.mahui.dao.EmployeeDao;
import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

public class EmployeeManageService {
	/*获取昵称*/
	public static String getNickName(String phone) {
		String nick = "";
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		EmployeeDao employeeDao = session.getMapper(EmployeeDao.class);
		Employee employeeTemp = null;  
		employeeTemp = employeeDao.isLogin(phone);
		nick = employeeTemp.getNickName();
		session.close();
		return nick;
	}
	/*检测用户是否存在*/
	public static boolean isEmployeeExist(String phone) {
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		EmployeeDao employeeDao = session.getMapper(EmployeeDao.class);
		Employee employeeTemp = null;  
		employeeTemp = employeeDao.isLogin(phone);
		if (employeeTemp != null
				&& employeeTemp.getPhoneNumber().equals(phone)) {
			// 用户已注册过了
			session.close();
			return true;
		}
		session.close();
		return false; //用户不存在
	}
	
	/*重设密码*/
	public static void resetPassword(String phone, String password) {
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		EmployeeDao employeeDao = session.getMapper(EmployeeDao.class);
		
		Employee employee = new Employee();
		employee.setPassWord(password);
		employee.setPhoneNumber(phone);
		employeeDao.ResteAnEmployeePassword(employee);
		session.commit();
		session.close();
	}
	
	/*判断用户注册信息完整性*/
	public static boolean isRegisterParamRight(Employee employee, String regFont, String registerPasswordAgain) {
		if(employee.getNickName().equals("") || employee.getNickName() == null
				|| employee.getPassWord().equals("") || employee.getPassWord() == null
				|| employee.getPhoneNumber().equals("") || employee.getPhoneNumber() == null
				|| employee.getPassWord().equals("") || employee.getPassWord() == null
				|| regFont.equals("") || regFont == null
				|| registerPasswordAgain.equals("") || registerPasswordAgain == null)
			return false;
		return true;
	}
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
