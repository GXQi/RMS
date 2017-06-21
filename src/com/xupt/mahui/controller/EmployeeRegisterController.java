package com.xupt.mahui.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.entity.Resume;
import com.xupt.mahui.service.EmployeeManageService;
import com.xupt.mahui.service.ResumeManageService;

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

	@RequestMapping("/submitUser") //点击“注册”，进行注册操作
	public ModelAndView dealRegister(Employee employee, @RequestParam("registerFont") String regFont,
			@RequestParam("againPassword") String regPasswordAgain, 
			@RequestParam("Isregister") int Isregister) {
		System.out.println("注册：" + Isregister);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register");
		if(Isregister == 1){
			return mav;//前台检测到错误，无需再进行任何操作；
		}
		if(EmployeeManageService.isRegisterParamRight(employee, regFont, regPasswordAgain) == false) {
			mav.addObject("warnInforLank", "true");
			return mav;//注册失败，说明用户已存在
		}
		if(EmployeeManageService.registerAnEmployee(employee) == false) {//检测注册是否成功
			mav.addObject("warnEmployee", "exist");
			return mav;//注册失败，说明用户已存在
		}
		mav.setViewName("signSuccess");
		return mav;//注册成功
	}
}
