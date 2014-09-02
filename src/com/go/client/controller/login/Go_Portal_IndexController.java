package com.go.client.controller.login;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.client.login.model.Go_Portal_Info;
import com.go.client.login.service.IGo_Portal_InfoService;
import com.go.controller.base.Go_BaseController;

/**
 * 门户主页信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/index")
public class Go_Portal_IndexController extends Go_BaseController{
	
	@Autowired
	public IGo_Portal_InfoService go_portal_infoService;
	
	/**
	 * 主页信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="index.htm")
	public String index(ModelMap model){
		return "client/login/index";
	}
	
	/**
	 * 客服区信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="customerArea.htm")
	public String customerArea(HttpServletRequest request,Go_Portal_Info portal_info,ModelMap model){
		portal_info=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal_info==null){//未登录账号时，跳转登陆页面
			return "redirect:/client/login/portal/toLogin.htm";
		}
		model.addAttribute("portal_info",portal_info);
		return "client/login/customerArea"; 
	}
}
