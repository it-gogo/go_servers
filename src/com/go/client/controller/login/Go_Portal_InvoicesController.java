package com.go.client.controller.login;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.cart.model.Go_Order_Detail;
import com.go.client.cart.model.Go_Order_Info;
import com.go.client.cart.service.IGo_Order_DetailService;
import com.go.client.cart.service.IGo_Order_InfoService;
import com.go.client.core.PageBean;
import com.go.client.login.model.Go_Portal_Info;
import com.go.controller.base.Go_BaseController;

/**
 *前台服务信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/invoices/*")
public class Go_Portal_InvoicesController extends Go_BaseController{
	
	@Autowired
	public IGo_Order_InfoService go_order_infoService;
	@Autowired
	public IGo_Order_DetailService go_order_detailService;
	
	/**
	 * 服务详情
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="detail.htm")
	public String detail(HttpServletRequest request,Go_Order_Info order,ModelMap model){
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		order=go_order_infoService.get(order.getId());
		model.put("order", order);
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("orderid", order.getId());
		params.put("column", "servername servername,hostname hostname,createdate createdate,maturity maturity,price price,configuration configuration");
		List<Map<String,Object>> list=go_order_detailService.getScaleList(params);
		for(Map<String,Object> map:list){
			String configuration=(String) map.get("configuration");
			if(configuration!=null || !"".equals(configuration)){
				JSONArray arr=JSONArray.fromObject(configuration);
				map.put("configurationarr", arr);
			}
		}
		model.put("detaillist", list);
		return "client/login/invoices";
	}
	
	/**
	 * 我的发票
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="myinvoices.htm")
	public String myinvoices(HttpServletRequest request,Go_PageData pageData,ModelMap model){
		request.getSession().removeAttribute("searchdata");
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("portal",portal.getId());
 		List<Go_Order_Info> list=go_order_infoService.listPageByParams(params, pageData);
		int allRow=go_order_infoService.count(params);
		
		PageBean<Go_Order_Info> pb=new PageBean<Go_Order_Info>();
		pb.setPageSize(pageData.getPageSize());
		pb.setCurentPage(pageData.getCurrentPage());
		pb.setAllRow(allRow);
		pb.setTotalPage(pb.countTotalPage());
		pb.setList(list);
		list.size();
		model.put("pb", pb);
		model.put("pageurl", "myinvoices.htm");
		return "client/login/myinvoices";
	}
}
