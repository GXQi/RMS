package com.xupt.mahui.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping("/resumemanage/search")
	public ModelAndView serch(){
		ModelAndView view=new ModelAndView();
		return view;
	}
	/**
	 * 查询简历 通过学历和工作年限
	 * @param json {"degree"："0"，"workTime","0"}
	 * 对于degree -1到5分别代表不限，应届毕业生，1年以下，1-3年，3-5年，5-10年，10年以上
	 * 同理对于对于workTime -1到4分别代表不限，大专以上，本科及以上，硕士及以上，博士及以上
	 * @return
	 */
	@RequestMapping("/resumemanage/select")
	public ModelAndView select(@RequestBody String json){
		ModelAndView view=new ModelAndView();
		return view;
	}
	/**
	 * 录入简历信息
	 * @param json {"basic":{},"work":{},"edu":{},"project":{}}
	 * @return
	 */
	@RequestMapping(value="/resumemanage/insert" ,method = RequestMethod.POST)
	public ModelAndView insert(@RequestBody String json){
		/**
		 * 录入成功跳到详情页面
		 * 录入失败
		 */
		ModelAndView view=new ModelAndView();
		if(ResumeManageService.insert(json)){
			//详情界面
			view.setViewName("");
		}else{
			//错误信息
			view.setViewName("login");
		}
		
		
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
		//返回到编辑详情
		return view;
	}
	
	

	
}
