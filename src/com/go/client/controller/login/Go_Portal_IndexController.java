package com.go.client.controller.login;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.login.model.Go_Portal_Info;
import com.go.client.login.model.Go_Ticket;
import com.go.client.login.service.IGo_Portal_InfoService;
import com.go.client.login.service.IGo_TicketService;
import com.go.controller.base.Go_BaseController;
import com.go.sys.section.model.Go_Notice_News;
import com.go.sys.section.service.IGo_NoticeService;

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
	@Autowired
	public IGo_TicketService go_ticketService;
	@Autowired
	public IGo_NoticeService go_noticeService;
	
	/**
	 * 主页信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="index.htm")
	public String index(ModelMap model){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("order_by", "createdate_desc");
		Go_Notice_News notice=go_noticeService.get(params);
		model.put("notice", notice);
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
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("isdispose_<>","关闭");
		Go_PageData pageData=new Go_PageData();
		List<Go_Ticket> listTicket=go_ticketService.listPageByParams(params, pageData);
		model.addAttribute("listTicket",listTicket);
		return "client/login/customerArea"; 
	}
}
