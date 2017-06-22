package com.xupt.mahui.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.entity.Resume;
import com.xupt.mahui.service.EmployeeManageService;
import com.xupt.mahui.service.ResumeManageService;
import com.xupt.mahui.util.SqlConfig;

/**
 * 登录相关的Controller
 * @author zhangxinyu
 *
 */
@Controller
public class EmployeeLoginController {
	@RequestMapping("login/gobackLogin")
	public String goBackLogin() {
		return "login";
	}
	
	@RequestMapping("/findPassword")//点击“找回密码”进入找回密码视图
	public String goToFindPassword() {
		return "findPassword";
	}
	
	//重设密码,url
	@RequestMapping("/login/resetPassword") 
	public ModelAndView resetPassword(@RequestParam("phone") String phone, 
			@RequestParam("newPassword") String password, 
			@RequestParam("rePassword") String rePassword,
			@RequestParam("IsResetPassword") int IsResetPassword) {
		System.out.println(phone + " " + password + " " + rePassword);
		ModelAndView mav = new ModelAndView();
		if(IsResetPassword == 1 
				|| password.equals("") || password == null
				|| rePassword.equals("") || rePassword == null) {
			mav.addObject("warnInforLank", "true");
			mav.addObject("remphone", phone);
			mav.setViewName("resetPassword");
			return mav;//重设密码失败
		}
		EmployeeManageService.resetPassword(phone, password);
		mav.setViewName("resetSuccess");
		return mav;
	}
	
	//找回密码url
	@RequestMapping("/login/findPass")
	public ModelAndView findPassword(@RequestParam("phoneNumber") String phone, 
			@RequestParam("registerFont") String font,
			@RequestParam("IsFindPassword") int IsFindPassword) {
		ModelAndView mav = new ModelAndView();
		System.out.println("找回密码：" + IsFindPassword);
		mav.setViewName("findPassword");
		if(IsFindPassword == 1)
			return mav;
		if(phone.equals("") || phone == null
				|| font.equals("") || font == null) {
			mav.addObject("warnInforLank", "true");			
			return mav;//找回密码失败
		}
		if(EmployeeManageService.isEmployeeExist(phone) == false) { //用户不存在，提示前端
			mav.addObject("warnNoEmployee", "true");
			return mav;//找回密码失败
		}
		mav.setViewName("resetPassword");
		mav.addObject("remphone", phone);
		System.out.println(phone + " ***** " + font);
		return mav;
	}
	
	@RequestMapping("/login/submitLogin")//点击“登录”进行登录处理
	public ModelAndView submitLogin(@ModelAttribute("Employee")Employee employee, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		if (EmployeeManageService.canAnEmployeeLogin(employee) == true) {//判断是否为合法用户 
			System.out.println("********");
			/*添加拦截器时，松开以下注释*/
			//HttpSession session = request.getSession();//获取http会话
			//session.setMaxInactiveInterval(60<<7);//默认会话时间为2小时8分钟
			//session.setAttribute("login", true);//激活会话
			List<Resume> list=ResumeManageService.getResume("-1","0",0,SqlConfig.pageSize);
			int count=ResumeManageService.getResumeCount("-1", "0");
			mav.addObject("resumeList", list);
			mav.addObject("totalPage", (count+SqlConfig.pageSize-1)/SqlConfig.pageSize);
			mav.addObject("total", count);
			mav.addObject("workTime", "-1");
			mav.addObject("degree", "-1");
			mav.addObject("currentPage", "1");
			mav.setViewName("search");
			Cookie cookie = new Cookie("nick", URLEncoder.encode(EmployeeManageService.getNickName(employee.getPhoneNumber()), "utf-8"));
			response.addCookie(cookie);
			return mav;//登陆成功，返回查询视图
		}			
		mav.addObject("warnEmployee", "noExist");
		mav.setViewName("login");
		return mav;//登录失败，返回原视图
	}
}
