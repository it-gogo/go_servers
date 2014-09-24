package com.go.client.controller.cart;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.go.sys.server.model.Go_Server_Info;
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
	
	/**
	 * 公共云服务器购物车
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="public.htm")
	public String publicCart(ModelMap model,Integer id){
		Go_Server_Info server=go_server_infoService.get(id);
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("serverId", id);
		server.setPricelist(go_server_priceService.list(params));
		model.put("server", server);
		return "client/cart/cloudServer";
	}
	
	/**
	 * 提交公共云服务器
	 * @return
	 */
	@RequestMapping(value="submitPublic.htm")
	public String submitPublic(HttpServletRequest request,ModelMap model,Go_Product_List product){
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
		product.setCart(cart.getId());
		go_product_listService.save(product);
		
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
	
}
