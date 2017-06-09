package com.xupt.mahui.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.xupt.mahui.entity.EditJson;
import com.xupt.mahui.entity.Message;
import com.xupt.mahui.entity.Resume;
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
	 * 对于degree -1到6分别代表不限，应届毕业生，1年以下，1-3年，3-5年，5-10年，10年以上
	 * 同理对于对于workTime -1到3分别代表不限，大专以上，本科及以上，硕士及以上，博士及以上
	 * @return
	 */
	@RequestMapping(value="/resumemanage/select",method=RequestMethod.POST ,produces = "application/json; charset=utf-8")
	public ModelAndView select(@RequestBody String json){
		String[] s=json.split("&");
		String degree=s[0].split("=")[1];
		String workTime=s[1].split("=")[1];
		ModelAndView view=new ModelAndView();
		List<Resume> list=ResumeManageService.getResume(workTime, degree);
		view.addObject("resumeList", list);
		view.addObject("total", list.size());
		view.addObject("workTime", workTime);
		view.addObject("degree", degree);
		view.setViewName("search");
		
		return view;
	}
	/**
	 * 录入简历信息
	 * @param json {"basic":{},"work":{},"edu":{},"project":{}}
	 * @return
	 */
	@RequestMapping(value="/resumemanage/insert" ,method = RequestMethod.POST)
	@ResponseBody
	public String insert(@RequestBody String json){
		/**
		 * 录入成功返回{"message":"success"}
		 * 录入失败返回{"message":"error"}
		 */
		Gson gson=new Gson();
		Message message=new Message();
		if(ResumeManageService.insert(json)){
			message.setMessage("success");
		}else{
			message.setMessage("error");
		}
		return gson.toJson(message);
	}
	/**
	 * 通过电话查询简历的具体信息
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
		view.addObject("projectExperienceList", ResumeManageService.getProjectExperiences(phonenumber));
		view.addObject("eductionExperienceList", ResumeManageService.getEductionExperiences(phonenumber));
		view.setViewName("details");
		//返回到编辑详情
		return view;
	}
	
	/**
	 * 通过电话查询简历的具体信息
	 * @param phonenumber
	 * @return 
	 * 
	 */
	@RequestMapping(value="/resumemanage/edit",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String edit(@RequestParam String phonenumber){
		EditJson editJson=new EditJson();
		editJson.setResumeBasic(ResumeManageService.getResumeBasic(phonenumber));
		editJson.setEducList(ResumeManageService.getEductionExperiences(phonenumber));
		editJson.setProList(ResumeManageService.getProjectExperiences(phonenumber));
		editJson.setWorkList(ResumeManageService.getWorkExperiences(phonenumber));
		editJson.setEducList(ResumeManageService.getEductionExperiences(phonenumber));
		return new Gson().toJson(editJson);
	}
	 /**
	  * 返回主界面
	  * 默认查询条件是不限
	  * @return
	  */
	@RequestMapping(value="/main")
	public ModelAndView main(){
		ModelAndView view=new ModelAndView();
		List<Resume> list=ResumeManageService.getResume("-1","0");
		view.addObject("resumeList", list);
		view.addObject("total", list.size());
		view.addObject("degree","-1");
		view.addObject("workTime","-1");
		view.setViewName("search");
		return view;
	}
	

	
}
