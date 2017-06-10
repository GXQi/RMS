package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.service.EmployeeManageService;

/**
 * 简历管理相关的Controller
 * @author zhangxinyu
 *
 */
@Controller
public class EmployeeRegisterController {

	@RequestMapping("/goBackLogin") //点击“已有账号”，返回登录视图
	public String goBackLogin(){
		return "login";
	}

	@RequestMapping("/sendIdCode")
	public void sendIdCode() {
		/*发送验证码*/
	}
	
	@RequestMapping("/submitUser") //点击“注册”，进行注册操作
	public ModelAndView dealRegister(Employee employee, @RequestParam("idCode") String idCode) {
		/*检测验证码是否正确*/
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signSuccess");
		if(EmployeeManageService.registerAnEmployee(employee) == false) {//检测注册是否成功
			mav.addObject("warnEmployee", "exist");
			mav.setViewName("register");
			return mav;//注册失败，说明用户已存在，返回该字符串提示前端
		}
		return mav;//注册成功，返回该字符串提示前端进行页面跳转
	}
	
	@RequestMapping("/submitUser/login")//在“注册成功”视图中，点击登录，直接跳转至“查询视图”
	public String goToIndex() {
		return "search";
	}
}
