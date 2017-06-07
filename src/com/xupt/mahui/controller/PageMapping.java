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
	 * 编辑简历界面
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "edit";
	}
	/**
	 * 录入简历界面
	 * @return
	 */
	@RequestMapping("/type-in")
	public String test(){
		return "type-in";
	}
}
