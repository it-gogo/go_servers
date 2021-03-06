package com.go.client.controller.cart;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.constant.Go_ControllerConstant;
import com.go.client.alipay.AlipayProperties;
import com.go.client.alipay.AlipaySubmit;
import com.go.client.cart.model.Go_Cart_Info;
import com.go.client.cart.model.Go_Order_Detail;
import com.go.client.cart.model.Go_Order_Info;
import com.go.client.cart.model.Go_Product_List;
import com.go.client.cart.service.IGo_Cart_InfoService;
import com.go.client.cart.service.IGo_Order_DetailService;
import com.go.client.cart.service.IGo_Order_InfoService;
import com.go.client.cart.service.IGo_Product_ListService;
import com.go.client.login.model.Go_Portal_Info;
import com.go.client.login.service.IGo_Portal_InfoService;
import com.go.client.util.ExtendDate;
import com.go.common.util.Go_PasswordUtil;
import com.go.controller.base.Go_BaseController;
import com.go.sys.server.model.Go_Configuration_Data;
import com.go.sys.server.model.Go_Server_Info;
import com.go.sys.server.service.IGo_Configuration_DataService;
import com.go.sys.server.service.IGo_Server_InfoService;
import com.go.sys.server.service.IGo_Server_PriceService;

/**
 * 购物车 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/cart/order/*")
public class Go_CartController extends Go_BaseController{
	
	@Autowired
	private IGo_Server_InfoService go_server_infoService;//服务器信息service
	@Autowired
	private IGo_Server_PriceService go_server_priceService;//服务器价格service
	@Autowired
	private IGo_Cart_InfoService go_cart_infoService;//购物车service
	@Autowired
	private IGo_Product_ListService go_product_listService;//商品列表service
	@Autowired
	private IGo_Configuration_DataService go_configuration_dataService;//可配置内容service
	@Autowired
	private IGo_Portal_InfoService go_portal_infoService;//门户信息service
	@Autowired
	private IGo_Order_InfoService go_order_infoService;//订单信息service
	@Autowired
	private IGo_Order_DetailService go_order_detailService;//订单详情信息service
	
	/**
	 * 公共云服务器购物车
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="order.htm")
	public String orderCart(ModelMap model,Integer id){
		Go_Server_Info server=go_server_infoService.get(id);
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("serverId", id);
		server.setPricelist(go_server_priceService.list(params));
		model.put("server", server);
		
		//查询配置项内容
		params=new HashMap<String,Object>();
		params.put("id_in", "select configuration from Go_Server_Configuration where server="+id);
		List<Go_Configuration_Data> configurationlist=go_configuration_dataService.list(params);
		Map<String,List<Go_Configuration_Data>> map=new HashMap<String,List<Go_Configuration_Data>>();
		for(Go_Configuration_Data configuration:configurationlist){
			String key=configuration.getTypename();
			List<Go_Configuration_Data> list=map.get(key);
			if(list==null){
				list=new ArrayList<Go_Configuration_Data>();
			}
			list.add(configuration);
			map.put(key, list);
		}
		model.put("map", map);
		return "client/cart/orderServer";
	}
	
	
	/**
	 * 配置编辑
	 * @param model
	 * @param id商品id
	 * @return
	 */
	@RequestMapping(value="modifyConfiguration.htm")
	public String modifyConfiguration(ModelMap model,Integer id){
		Go_Product_List product=go_product_listService.get(id);
		model.put("product", product);
		String jsonStr=product.getConfiguration();
		if(jsonStr!=null && !"".equals(jsonStr)){
			JSONArray arr=JSONArray.fromObject(jsonStr);
			Map<String,JSONObject> map=new HashMap<String,JSONObject>();
			for(int i=0;i<arr.size();i++){
				JSONObject obj=arr.getJSONObject(i);
				if(obj!=null){
					map.put(obj.getString("name"), obj);
				}
			}
			model.put("configurationmap", map);
		}
		return orderCart(model,product.getServer());
	}
	
	/**
	 * 提交公共云服务器
	 * @return
	 */
	@RequestMapping(value="submitPublic.htm")
	public String submitPublic(HttpServletRequest request,ModelMap model,Go_Product_List product){
//		Go_Portal_Info portal_info=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		String ip=request.getLocalAddr();//访问IP地址
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("ip", ip);
//		if(portal_info!=null){
//			params.put("or_portal", portal_info.getId());
//		}
		Go_Cart_Info cart=go_cart_infoService.get(params);
		if(cart==null){
			cart=new Go_Cart_Info();
			cart.setIp(ip);
			cart.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
			cart=go_cart_infoService.save(cart);
		}
		product.setCart(cart.getId());
		if(product.getId()==null){
			go_product_listService.save(product);
		}else{
			go_product_listService.update(product);
		}
		
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 查看购物车
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="lookCart.htm")
	public String lookCart(HttpServletRequest request,ModelMap model){
		String ip=request.getLocalAddr();//访问IP地址
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("ip", ip);
		Go_Cart_Info cart=go_cart_infoService.get(params);
		if(cart==null){
			cart=new Go_Cart_Info();
			cart.setIp(ip);
			cart.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
			cart=go_cart_infoService.save(cart);
		}
		params=new HashMap<String,Object>();
		params.put("cart", cart.getId());
		params.put("column", "id  id,type  type,totalprice totalprice,configuration  configuration,(select name from Go_Server_Info b where b.id=server) servername,(select monthlyPrice from Go_Server_Price  where id=price) monthlyPrice,(select numMonth from Go_Server_Price  where id=price) numMonth  ");
		List<Map<String,Object>> productlist=go_product_listService.getScaleList(params);
		for(Map<String,Object> map:productlist){
			String jsonStr=(String) map.get("configuration");
			if(jsonStr!=null && !"".equals(jsonStr)){
				JSONArray arr=JSONArray.fromObject(jsonStr);
				map.put("configurationarr", arr);
			}
		}
		cart.setProductlist(productlist);
		model.put("cart", cart);
		return "client/cart/settlement";
	}
	
	/**
	 * 结账
	 * @param model
	 * @param portal
	 * @param cartid
	 * @param loginemail
	 * @param loginpw
	 * @param notes
	 * @return
	 */
	@RequestMapping(value="checkout.htm")
	public String checkout(HttpServletRequest request,ModelMap model,Go_Portal_Info portal,Integer cartid,String loginemail,String loginpw,String notes,String cust){
		Map<String,Object> params=new HashMap<String,Object>();
		boolean ok=true;//判断是否错误
		if("old".equals(cust)){
			if(loginemail==null  || "".equals(loginemail) || loginpw==null || "".equals(loginpw)){ 
				model.put("error_msg", "#  登录错误，请重试。  # ");
				model.put("cust", "old");
				ok=false;//结账失败
			}else{
				String  pw="";
				if(loginpw!=null && !"".equals(loginpw)){
					pw=Go_PasswordUtil.encrypt(loginpw);
				}
				params.put("email", loginemail);
				params.put("password", pw);
				portal=go_portal_infoService.get(params);
				
				if(portal==null){//账号不存在
					model.put("error_msg", "#  登录错误，请重试。  # ");
					model.put("cust", "old");
					ok=false;//结账失败
					//return "client/cart/settlement";
				}
			}
		}else{
			if(portal.getId()!=null){
				portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
			}else{
				error_msg="";
				String str=portal.getName();
				if(str==null || "".equals(str)){
					error_msg+="#  未填写您的名  ";
				}
				str=portal.getSurname();
				if(str==null || "".equals(str)){
					error_msg+="#  未填写您的姓  ";
				}
				str=portal.getEmail();
				if(str==null || "".equals(str)){
					error_msg+="#  未填写邮件地址  ";
				}
				str=portal.getTelephone();
				if(str==null || "".equals(str)){
					error_msg+="#  未填写电话号码  ";
				}
				String password=portal.getPassword();
				if(password==null || "".equals(password)){
					error_msg+="#  未输入密码   ";
				}
				if(error_msg!=null && !"".equals(error_msg)){
					error_msg+="#";
					model.put("error_msg", error_msg);
					model.put("cust", "new");
					model.put("portal", portal);
					ok=false;//结账失败
					//return "client/cart/settlement";
				}else{
					portal.setPassword(Go_PasswordUtil.encrypt(password));
					portal=go_portal_infoService.save(portal);
					
				}
			}
		}
		
		if(!ok){
			params=new HashMap<String,Object>();
			Go_Cart_Info cart=new Go_Cart_Info();
			cart.setId(cartid);
			params.put("cart", cart.getId());
			params.put("column", "id  id,type  type,configuration  configuration,(select name from Go_Server_Info b where b.id=server) servername,(select monthlyPrice from Go_Server_Price  where id=price) monthlyPrice,(select numMonth from Go_Server_Price  where id=price) numMonth  ");
			List<Map<String,Object>> productlist=go_product_listService.getScaleList(params);
			for(Map<String,Object> map:productlist){
				String jsonStr=(String) map.get("configuration");
				if(jsonStr!=null && !"".equals(jsonStr)){
					JSONArray arr=JSONArray.fromObject(jsonStr);
					map.put("configurationarr", arr);
				}
			}
			cart.setProductlist(productlist);
			model.put("cart", cart);
			return "client/cart/settlement";
		}
		
		request.getSession().setAttribute("loginInfo", portal);
		
		Go_Order_Info order=new Go_Order_Info();//订单信息
		order.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
		order.setNotes(notes);
		order.setOrdername(portal.getSurname()+portal.getName());
		order.setOrdertelephone(portal.getTelephone());
		order.setPayment("支付宝支付");
		order.setStatus("提交支付");
		order.setSeq("1");
		order.setPortal(portal.getId());
		order.setTotalprice("");
		go_order_infoService.save(order);//保存订购
		
		params=new HashMap<String,Object>();
		params.put("cart", cartid);
		params.put("column", "server server,servername servername,type servertype,price priceid,(select numMonth from Go_Server_Price where id=price) time,(select quarter from Go_Server_Price where id=price) quarter," +
				"(select cpu from Go_Server_Info where id=server) cpu,(select memory from Go_Server_Info where id=server) memory,(select disk from Go_Server_Info where  id=server) disk,(select flow from Go_Server_Info where  id=server) flow,(select ipNum from Go_Server_Info where id=server) ipNum," +
				"hostname hostname,ns1prefix ns1prefix,ns2prefix ns2prefix,rootpw rootpw,configuration configuration,totalprice price");
		List<Map<String,Object>> mlist=go_product_listService.getScaleList(params);
		double totalprice=0.0;
		/*Go_Order_Detail entity=new Go_Order_Detail();
		go_order_detailService.save(entity);
		if(1==1){
			return "";
		}*/
		for(Map<String,Object> map:mlist){
//			Go_Order_Detail detail=new Go_Order_Detail();
			JSONObject obj=JSONObject.fromObject(map);
			Go_Order_Detail detail=(Go_Order_Detail) JSONObject.toBean(obj, Go_Order_Detail.class);
			String price=detail.getPrice();
			if(price!=null && !"".equals(price)){
				totalprice+=Double.valueOf(price);
			}
			detail.setOrderid(order.getId());
			detail.setMaturity(ExtendDate.getYMD_h_m_s(new Date()));//到期时间
			detail.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));//创建时间
			go_order_detailService.save(detail);//保存订购详细
//			detail.setConfiguration(product.getConfiguration());
		}
		order.setTotalprice(totalprice+"");
		go_order_infoService.update(order);//保存订购
		
		go_cart_infoService.delete(cartid);//删除购物车
		params=new HashMap<String,Object>();
		params.put("cart", cartid);
		go_product_listService.deleteList(params);//删除商品列表
		
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
		alipay.put("exter_invoke_ip", request.getLocalAddr());//客户端的IP地址
		
//		model.put("alipay", alipay);
		String sHtmlText = AlipaySubmit.buildRequest(alipay,"get","确认");
		model.put("form", sHtmlText);
		System.out.println(sHtmlText);
		return "client/cart/checkout";
	}
	
	/**
	 * 支付成功返回方法
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="alipayReturn.htm")
	public String alipayReturn(ModelMap model,Integer id){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("update_status", "支付成功");
		params.put("update_seq", "2");
		params.put("where_id", id);
		go_order_infoService.updateField(params);
		return "client/cart/alipayReturn";
	}
	
	/**
	 * 移除商品
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="removeProduct.htm")
	public String removeProduct(ModelMap model,Integer id){
		go_product_listService.delete(id);
		model.addAttribute("show_msg",1);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 清空购物车
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="emptyCart.htm")
	public String emptyCart(ModelMap model,Integer id){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("cart", id);
		go_product_listService.deleteList(params);
		model.addAttribute("show_msg",1);
		return "redirect:lookCart.htm";
	}
	
}
