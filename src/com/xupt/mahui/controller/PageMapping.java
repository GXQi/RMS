package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
/**
 * 页面映射
 * @author mahui
 *
 */
@Controller
public class PageMapping {
	/**
	 * 编辑简历界面
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(@RequestParam String phonenumber){
		return "edit";
	}
	/**
	 * 录入简历界面
	 * @return
	 */
	@RequestMapping("/type-in")
	public String typeIn(){
		return "type-in";
	}
	
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
	
	/**
	 * 主界面
	 * @return
	 */
	@RequestMapping("/main")
	public String main(){
		return "search";
	}
}
