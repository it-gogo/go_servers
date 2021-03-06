package com.go.client.controller.login;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.alipay.AlipayCore;
import com.go.client.alipay.AlipayProperties;
import com.go.client.alipay.AlipaySubmit;
import com.go.client.alipay.MD5;
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
		
		
		
		
		
		Map<String,String> alipay=new HashMap<String,String>();
		alipay.put("service", "create_direct_pay_by_user");
        alipay.put("partner", AlipayProperties.getValue("pid"));// 合作身份者ID，以2088开头由16位纯数字组成的字符串
        alipay.put("_input_charset", "utf-8");//字符编码格式 目前支持 gbk 或 utf-8
		alipay.put("payment_type", "1");//支付类型
//		alipay.put("notify_url", AlipayProperties.getValue("url")+"");//服务器异步通知页面路径
		alipay.put("return_url", AlipayProperties.getValue("url")+"/client/cart/order/alipayReturn.htm?id="+order.getId());//页面跳转同步通知页面路径
		alipay.put("seller_email", AlipayProperties.getValue("seller_email"));
		alipay.put("out_trade_no", order.getId()+"");//商户订单号
		alipay.put("subject", "智易推"+order.getId());//订单名称
		alipay.put("total_fee", order.getTotalprice());//付款金额
		alipay.put("body", "智易推"+order.getId()+",金额:"+order.getTotalprice());//订单描述
		alipay.put("paymethod", "bankPay");//默认支付方式
		alipay.put("defaultbank", AlipayProperties.getValue("defaultbank"));//默认网银
//		alipay.put("show_url", AlipayProperties.getValue("url")+"");//商品展示地址
		alipay.put("anti_phishing_key", "");//防钓鱼时间戳
//		alipay.put("exter_invoke_ip", request.getLocalAddr());//客户端的IP地址
		alipay.put("exter_invoke_ip", "172.241.157.249");//客户端的IP地址
		
		String sHtmlText = AlipaySubmit.buildRequest(alipay,"get","确认");
		System.out.println(sHtmlText);
		sHtmlText=sHtmlText.replace("<script>document.forms['alipaysubmit'].submit();</script>", "");
		
//		String prestr = AlipayCore.createLinkString(alipay); //把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
//        String mysign = "";
//        if(AlipayProperties.getValue("sign_type").equals("MD5") ) {
//        	mysign = MD5.sign(prestr, AlipayProperties.getValue("key"), AlipayProperties.getValue("input_charset"));
//        }
//		alipay.put("sign", mysign);
//		alipay.put("sign_type", AlipayProperties.getValue("sign_type"));
//		Iterator<String> it= alipay.keySet().iterator();
//		String url="https://mapi.alipay.com/gateway.do";
//		int i=0;
//		while(it.hasNext()){
//			String key=it.next();
//			String value=alipay.get(key);
//			if(i==0){
//				url+="?"+key+"="+value;
//			}else{
//				url+="&"+key+"="+value;
//			}
//			i++;
//		}
		model.put("form",sHtmlText);
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
