package com.go.client.controller.login;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.login.model.Go_Portal_Info;
import com.go.client.login.service.IGo_Portal_InfoService;
import com.go.controller.base.Go_BaseController;

/**
 * 门户信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/portal")
public class Go_Portal_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_Portal_InfoService go_portal_infoService;
	
	/**
	 * 注册信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="registration.htm")
	public String registration(Go_PageData pageData){
		return "client/login/registration";
	}
	
	/**
	 * 提交注册信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="save.htm")
	public String save(HttpServletRequest request,Go_Portal_Info portal_info,ModelMap model){
		portal_info=go_portal_infoService.save(portal_info);
		model.addAttribute("portal_info",portal_info);
		return "client/login/customerArea"; 
	}
	
	/**
	 *登陆信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="login.htm")
	public String login(Go_PageData pageData){
		return "client/login/login";
	}
	
	
	
	
}
