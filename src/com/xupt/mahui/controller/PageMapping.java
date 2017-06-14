package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 页面映射
 * @author mahui
 *
 */
@Controller
public class PageMapping {
	
	/**
	 * 登录界面
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	/**
	 * 注册界面
	 * @return
	 */
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	
}
