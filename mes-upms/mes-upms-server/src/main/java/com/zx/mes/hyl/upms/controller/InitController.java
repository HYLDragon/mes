package com.zx.mes.hyl.upms.controller;


import com.zx.mes.hyl.upms.service.InitServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


/**
 * 初始化数据库控制器
 * 
 * @author 
 * 
 */
@Controller
@RequestMapping("/initController")
public class InitController {

	@Autowired
	private InitServiceI initService;

	/**
	 * 初始化数据库后转向到首页
	 * 
	 * @return
	 */
	@RequestMapping("/init")
	public String init(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		initService.init();
		return "redirect:/";
	}

}
