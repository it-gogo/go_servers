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
import com.go.client.cart.model.Go_Order_Detail;
import com.go.client.cart.service.IGo_Order_DetailService;
import com.go.client.core.PageBean;
import com.go.client.login.model.Go_Portal_Info;
import com.go.controller.base.Go_BaseController;

/**
 *前台服务信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/server")
public class Go_Portal_ServerController extends Go_BaseController{
	
	@Autowired
	public IGo_Order_DetailService go_order_detailService;
	
	/**
	 * 服务详情
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="detail.htm")
	public String detail(HttpServletRequest request,Go_Order_Detail detail,ModelMap model){
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("id", detail.getId());
		params.put("column", "isfinish isfinish,result result,id id,createdate createdate,servertype servertype,servername servername,hostname hostname,price price,maturity maturity,quarter quarter,(select status from Go_Order_Info where id=orderid)  status,(select payment from Go_Order_Info where id=orderid) payment");
		
		List<Map<String,Object>> list=go_order_detailService.getScaleList(params);
//		Map<String,Object> map=(Map<String, Object>) go_order_detailService.getScale(params);
		if(list!=null && list.size()>0){
			model.put("detail", list.get(0));
		}
		return "client/login/serverDetail";
	}
	
	/**
	 * 我的服务
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="myserver.htm")
	public String myserver(HttpServletRequest request,Go_PageData pageData,ModelMap model){
		request.getSession().removeAttribute("searchdata");
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("orderid_in","(select id from Go_Order_Info where portal="+portal.getId()+" )");
		params.put("order_by", "isfinish_desc");
 		List<Go_Order_Detail> list=go_order_detailService.listPageByParams(params, pageData);
		int allRow=go_order_detailService.count(params);
		
		PageBean<Go_Order_Detail> pb=new PageBean<Go_Order_Detail>();
		pb.setPageSize(pageData.getPageSize());
		pb.setCurentPage(pageData.getCurrentPage());
		pb.setAllRow(allRow);
		pb.setTotalPage(pb.countTotalPage());
		pb.setList(list);
		list.size();
		model.put("pb", pb);
		model.put("pageurl", "myserver.htm");
		return "client/login/myServer";
	}
	
	/**
	 * 查询
	 * @param pageData
	 * @param ticket
	 * @param model
	 * @return
	 */
	@RequestMapping(value="searchserver.htm")
	public String searchserver(HttpServletRequest request,Go_Order_Detail detail,Go_PageData pageData,ModelMap model){
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("orderid_in","(select id from Go_Order_Info where portal="+portal.getId()+" )");
		String hostname=detail.getHostname();
		if(hostname!=null){
			hostname=hostname.trim();
			params.put("hostname_like",hostname);
			model.put("hostname", hostname);
			request.getSession().setAttribute("searchdata", hostname);
		}else{
			hostname=(String) request.getSession().getAttribute("searchdata");
			if(hostname!=null && !"".equals(hostname)){
				params.put("hostname_like",hostname);
				model.put("hostname", hostname);
			}
		}
 		List<Go_Order_Detail> list=go_order_detailService.listPageByParams(params, pageData);
		int allRow=go_order_detailService.count(params);
		
		PageBean<Go_Order_Detail> pb=new PageBean<Go_Order_Detail>();
		pb.setPageSize(pageData.getPageSize());
		pb.setCurentPage(pageData.getCurrentPage());
		pb.setAllRow(allRow);
		pb.setTotalPage(pb.countTotalPage());
		pb.setList(list);
		list.size();
		model.put("pb", pb);
		model.put("pageurl", "searchserver.htm");
		return "client/login/myServer";
	}
	
}
