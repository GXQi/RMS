package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.mahui.entity.ResumeBasic;
import com.xupt.mahui.service.ResumeManageService;

@Controller
public class ResumeController {
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam String phonenumber){
		ResumeManageService resumeManageService=new ResumeManageService();
		if(resumeManageService.delete(phonenumber))
			return "true";
		else
			return "false";
	}
	@RequestMapping("/select")
	public ModelAndView select(){
		ResumeBasic resumeBasic=new ResumeBasic();
		resumeBasic.setName("马辉");
		resumeBasic.setEmail("ismahui@163.com");
		ModelAndView view=new ModelAndView();
		view.setViewName("content");
		view.addObject("resumeBasic", resumeBasic);
		return view;
	}
}
