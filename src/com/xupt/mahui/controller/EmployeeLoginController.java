package com.xupt.mahui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.entity.Employee;
import com.xupt.mahui.entity.Resume;
import com.xupt.mahui.service.EmployeeManageService;
import com.xupt.mahui.service.ResumeManageService;

/**
 * 登录相关的Controller
 * @author zhangxinyu
 *
 */
@Controller
public class EmployeeLoginController {
	@RequestMapping("/login/register") //点击“注册”进入注册视图
	public String goToRegister(){
		return "register";
	}
	
	@RequestMapping("/login/findPassword")//点击“找回密码”进入找回密码视图
	public String goToFindPassword() {
		return "findPassword";
	}
	
	
	@RequestMapping("/login/submitLogin")//点击“登录”进行登录处理
	public ModelAndView submitLogin(@ModelAttribute("Employee")Employee employee, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		System.out.println(employee.getPhoneNumber() + "  " + employee.getPassWord());
		if (EmployeeManageService.canAnEmployeeLogin(employee) == true) {//判断是否为合法用户 
			System.out.println("********");
			/*添加拦截器时，松开以下注释*/
			//HttpSession session = request.getSession();//获取http会话
			//session.setMaxInactiveInterval(60<<7);//默认会话时间为2小时8分钟
			//session.setAttribute("login", true);//激活会话
			List<Resume> list=ResumeManageService.getResume("-1","0");
			int end=0;
			int start=0;
			if(start+5<list.size()){
				end=start+5;
			}else{
				end=list.size();
			}
			List<Resume> resumeList=list.subList(start,end);
			mav.addObject("resumeList", resumeList);
			mav.addObject("totalPage", (list.size()+5-1)/5);
			mav.addObject("total", list.size());
			mav.addObject("workTime", "-1");
			mav.addObject("degree", "-1");
			mav.setViewName("search");
			return mav;//登陆成功，返回查询视图
			//return "search";
		}			
		mav.addObject("warnEmployee", "noExist");
		mav.setViewName("login");
		return mav;//登录失败，返回原视图
		//return "login";
	}
	
}
