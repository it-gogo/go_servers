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
import com.go.client.cart.model.Go_Cart_Info;
import com.go.client.cart.model.Go_Product_List;
import com.go.client.cart.service.IGo_Cart_InfoService;
import com.go.client.cart.service.IGo_Product_ListService;
import com.go.client.util.ExtendDate;
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
@RequestMapping(value="/client/cart/*")
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
		params.put("column", "id  id,type  type,configuration  configuration,(select name from Go_Server_Info b where b.id=server) servername,(select monthlyPrice from Go_Server_Price  where id=price) monthlyPrice,(select numMonth from Go_Server_Price  where id=price) numMonth  ");
		List<Map<String,Object>> productlist=go_product_listService.getScaleList(params);
		cart.setProductlist(productlist);
		model.put("cart", cart);
		return "client/cart/settlement";
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
