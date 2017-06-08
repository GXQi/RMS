package com.xupt.mahui.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.service.EmployeeManageService;

/**
 * 简历管理相关的Controller
 * @author zhangxinyu
 *
 */
@Controller
public class EmployeeLoginController {
	@RequestMapping("/login/register") //点击“注册”进入注册视图
	public String goToRegister(){
		return "sign";
	}
	@RequestMapping("/login/findPassword")//点击“找回密码”进入找回密码视图
	public String goToFindPassword() {
		return "findPassword";
	}
	
	@RequestMapping("/login/submitLogin")//点击“登录”进行登录处理
	public String submitLogin(Employee employee, HttpServletRequest request){
		if (EmployeeManageService.canAnEmployeeLogin(employee) == true) {//判断是否为合法用户 
			/*添加拦截器时，松开以下注释*/
			//HttpSession session = request.getSession();//获取http会话
			//session.setMaxInactiveInterval(60<<7);//默认会话时间为2小时8分钟
			//session.setAttribute("login", true);//激活会话
			return "search";//登陆成功，返回查询视图
		}			
		return "login";//登录失败，返回原视图
	}
	
}
