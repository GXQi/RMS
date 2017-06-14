package com.xupt.mahui.test;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import com.xupt.mahui.service.ResumeManageService;
import com.xupt.mahui.util.HtmlGenerator;
import com.xupt.mahui.util.PdfGenerator;

public class ResumeTest {
	public static void main(String[] args) throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		String phonenumber="17629034550";
		map.put("resumeBasic", ResumeManageService.getResumeBasic(phonenumber));
		map.put("workExperienceList", ResumeManageService.getWorkExperiences(phonenumber));
		map.put("projectExperienceList", ResumeManageService.getProjectExperiences(phonenumber));
		map.put("eductionExperienceList", ResumeManageService.getEductionExperiences(phonenumber));
		String html=HtmlGenerator.generate("test.ftl", map);
		File file=new File("b.pdf");
		PdfGenerator.generate(html, new FileOutputStream(file));
	}

}
