package com.xupt.mahui.dao;

import org.apache.ibatis.annotations.Param;

import com.xupt.mahui.entity.Employee;
/**
 * 员工管理的dao层
 * @author mahui
 *
 */
public interface EmployeeDao {
	public Employee isLogin(String phonenumber);
	public void insertAnEmployee(@Param("employee")Employee employee);
	public void ResteAnEmployeePassword(@Param("employee")Employee employee);
}
