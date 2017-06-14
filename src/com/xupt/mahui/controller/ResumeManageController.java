package com.xupt.mahui.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.xupt.mahui.entity.Message;
import com.xupt.mahui.entity.Resume;
import com.xupt.mahui.service.ResumeManageService;
import com.xupt.mahui.util.HtmlGenerator;
import com.xupt.mahui.util.PdfGenerator;
import com.xupt.mahui.util.SqlConfig;


/**
 * 简历管理相关的Controller
 * @author mahui
 *
 */
@Controller
public class ResumeManageController {
	@RequestMapping("/search")
	public ModelAndView serch(){
		ModelAndView view=new ModelAndView();
		return view;
	}
	/**
	 * 查询简历 通过学历和工作年限
	 * @param json {"degree"："0"，"workTime":"0","currentPage":"1"}
	 * 对于degree -1到6分别代表不限，应届毕业生，1年以下，1-3年，3-5年，5-10年，10年以上
	 * 同理对于对于workTime -1到3分别代表不限，大专以上，本科及以上，硕士及以上，博士及以上
	 * @return
	 */
	@RequestMapping(value="/select",method=RequestMethod.POST ,produces = "application/json; charset=utf-8")
	public ModelAndView select(@RequestBody String json){
		String[] s=json.split("&");
		String degree=s[0].split("=")[1];
		String workTime=s[1].split("=")[1];
		int start=Integer.parseInt(s[2].split("=")[1])-1;
		ModelAndView view=new ModelAndView();
		List<Resume> list=ResumeManageService.getResume(workTime, degree,SqlConfig.pageSize*start,SqlConfig.pageSize);
		int count=ResumeManageService.getResumeCount(workTime, degree);
		view.addObject("resumeList", list);
		view.addObject("totalPage", (count+SqlConfig.pageSize-1)/SqlConfig.pageSize);
		view.addObject("total", count);
		view.addObject("workTime", workTime);
		view.addObject("degree", degree);
		view.addObject("currentPage", Integer.parseInt(s[2].split("=")[1]));
		view.setViewName("search");
		return view;
	}
	/**
	 * 录入简历信息
	 * @param json {"basic":{},"work":{},"edu":{},"project":{}}
	 * @return
	 */
	@RequestMapping(value="/insert" ,method = RequestMethod.POST)
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
	 * 通过电话查询简历的具体信息(详情)
	 * @param phone
	 * @return
	 */
	@RequestMapping(value="/show",method = RequestMethod.POST)
	public ModelAndView show(@RequestBody String phone){
		String phonenumber=phone.split("=")[1];
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
	  * 返回主界面
	  * 默认查询条件是不限
	  * @return
	  */
	@RequestMapping(value="/main")
	public ModelAndView main(){
		ModelAndView view=new ModelAndView();
		List<Resume> list=ResumeManageService.getResume("-1","0",0,SqlConfig.pageSize);
		int count=ResumeManageService.getResumeCount("-1", "0");
		view.addObject("resumeList", list);
		view.addObject("totalPage", (count+SqlConfig.pageSize-1)/SqlConfig.pageSize);
		view.addObject("total", count);
		view.addObject("degree","-1");
		view.addObject("workTime","-1");
		view.addObject("currentPage","1");
		view.setViewName("search");
		return view;
	}
	
	
	/**
	 * 编辑界面
	 * @param phone
	 * @return
	 */
	@RequestMapping(value="/edit",method = RequestMethod.POST)
	public ModelAndView edit(@RequestBody String phone){
		String phonenumber=phone.split("=")[1];
		ModelAndView view=new ModelAndView();
		view.addObject("resumeBasic", ResumeManageService.getResumeBasic(phonenumber));
		view.addObject("projectList", ResumeManageService.getProjectExperiences(phonenumber));
		view.addObject("workList", ResumeManageService.getWorkExperiences(phonenumber));
		view.addObject("eductionList", ResumeManageService.getEductionExperiences(phonenumber));
		view.setViewName("edit");
		return view;
	}
	/**
	 * 简历下载
	 * @return
	 * @throws Exception 
	 * @throws IOException
	 */
	/***
     * 实现文件下载
	 * @throws Exception 
     * ***/
    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(@RequestParam String phonenumber) throws Exception {
    	System.out.println("执行le");
    	String downloadFileName = new String("简历附件".getBytes("UTF-8"),"ISO-8859-1");
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        responseHeaders.setContentDispositionFormData("attachment", downloadFileName);
        Map<String,Object> map=new HashMap<String, Object>();
		map.put("resumeBasic", ResumeManageService.getResumeBasic(phonenumber));
		map.put("workExperienceList", ResumeManageService.getWorkExperiences(phonenumber));
		map.put("projectExperienceList", ResumeManageService.getProjectExperiences(phonenumber));
		map.put("eductionExperienceList", ResumeManageService.getEductionExperiences(phonenumber));
		String html=HtmlGenerator.generate("download.ftl", map);
		File file=new File("简历附件.pdf");
		PdfGenerator.generate(html, new FileOutputStream(file));
        try{
            /**
             * arg1:需要响应到客户端的数据 arg2:设置本次请求的响应头 arg3:响应到客户端的状态码
             * ***/
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                    responseHeaders, HttpStatus.CREATED);
        }catch (IOException e)
        {
            e.printStackTrace();
        }
        return null;
    }
	
}
