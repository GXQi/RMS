package com.xupt.mahui.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.service.LoginService;

@Controller
public class LoginController {
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam String phonenumber,@RequestParam String password){
		LoginService loginService=new LoginService();
		if(loginService.isOk(phonenumber, password)){
			//登陆成功返回主页
			ModelAndView view=new ModelAndView();
			return view;
		}else{
			
			ModelMap map=new ModelMap();
			map.addAttribute("error", "登录失败");
			ModelAndView view=new ModelAndView();
			view.setViewName("error");
			view.addObject(map);
			return view;
		}
	}
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
}
