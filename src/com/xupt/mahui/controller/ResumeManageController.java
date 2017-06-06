package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * 简历管理相关的Controller
 * @author mahui
 *
 */
@Controller
public class ResumeManageController {
	@RequestMapping("/index")
	public String index(){
		return "edit";
	}
	
	@RequestMapping("/resumemanage/search")
	public ModelAndView serch(){
		ModelAndView view=new ModelAndView();
		return view;
	}
	
	@RequestMapping("/resumemanage/select")
	public ModelAndView select(){
		ModelAndView view=new ModelAndView();
		return view;
	}
	
	@RequestMapping("/resumemanage/insert")
	public ModelAndView insert(){
		ModelAndView view=new ModelAndView();
		return view;
	}
	public ModelAndView show(){
		ModelAndView view=new ModelAndView();
		return view;
	}
	@RequestMapping("/type-in")
	public String test(){
		return "type-in";
	}
	
}
