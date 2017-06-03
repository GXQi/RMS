package com.xupt.mahui.dao;

import com.xupt.mahui.entity.Employee;
/**
 * 员工管理的dao层
 * @author mahui
 *
 */
public interface EmployeeDao {
	public Employee isLogin(String phonenumber);
}
