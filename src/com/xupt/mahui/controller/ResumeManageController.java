package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.service.ResumeManageService;
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
	/**
	 * 通过电话查询简历的具体信息（即点击编辑的的接口）
	 * @param phonenumber
	 * @return
	 */
	@RequestMapping("/resumemanage/show")
	public ModelAndView show(@RequestParam String phonenumber){
		ModelAndView view=new ModelAndView();
		/**
		 * 返回resumeBasic 基本对象
		 * 返回workExperienceList 集合  
		 * 返回projectExperienceList 集合  
		 * 返回eductionExperienceList 集合  
		 */
		view.addObject("resumeBasic", ResumeManageService.getResumeBasic(phonenumber));
		view.addObject("workExperienceList", ResumeManageService.getWorkExperiences(phonenumber));
		view.addObject("projectExperienceList", ResumeManageService.getWProjectExperiences(phonenumber));
		view.addObject("eductionExperienceList", ResumeManageService.getEductionExperiences(phonenumber));
		return view;
	}
	
	
	@RequestMapping("/type-in")
	public String test(){
		return "type-in";
	}
	
}
