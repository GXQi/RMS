package com.xupt.mahui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 简历管理相关的Controller
 * @author mahui
 *
 */
@Controller
public class ResumeManageController {
	@RequestMapping("/index")
	public String index(){
		return "type-in";
	}
}
