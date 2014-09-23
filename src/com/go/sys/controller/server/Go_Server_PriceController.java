package com.go.sys.controller.server;

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
import com.go.base.module.Go_PageData;
import com.go.controller.base.Go_BaseController;
import com.go.sys.server.model.Go_Server_Info;
import com.go.sys.server.model.Go_Server_Price;
import com.go.sys.server.service.IGo_Server_PriceService;

/**
 * 价格信息控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/server/server_price/*")
public class Go_Server_PriceController extends Go_BaseController {

	@Autowired
	private IGo_Server_PriceService go_server_priceService;
	/**
	 * 服务器信息初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(ModelMap model,int rowIndex,int tabIndex,int serverId){
		model.put("rowIndex", rowIndex);
		model.put("tabIndex", tabIndex);
		model.put("serverId", serverId);
		return "sys/server/price/serverPrice";
	}
	
	/**
	 * 服务器信息列表页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping("findlist.htm")
	public String findlist(ModelMap model,Go_PageData pageData,String gt_json){
		Map<String,Object> params= new HashMap<String, Object>();
		JSONArray arr=JSONArray.fromObject(gt_json);
		for(int i=0;i<arr.size();i++){
			JSONObject obj=arr.getJSONObject(i);
			String name=(String) obj.get("id");
			String value=(String) obj.get("vals");
			if(value!=null  &&  !"".equals(value)){
				params.put(name+"_like", value);
			}
		}
		JSONObject  res = new JSONObject();
		List<Go_Server_Price> list=go_server_priceService.listPageByParams(params, pageData);
		res.put("total", pageData.getTotalSize());
		res.put("rows", JSONArray.fromObject(list));
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 服务器信息新增操作页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "loadxx.htm")
	public String loadxx(Go_Server_Price serverPrice,ModelMap model){
		serverPrice=go_server_priceService.get(serverPrice.getId());
		JSONObject obj=JSONObject.fromObject(serverPrice);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 服务器信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Server_Price serverPrice){
//		serverInfo.setType("公告");
//		serverInfo.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
		go_server_priceService.save(serverPrice);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 服务器信息更新
	 * @param request
	 * @param model
	 * @param notice
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Server_Price serverPrice){
		go_server_priceService.update(serverPrice);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Server_Price serverPrice,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", serverPrice.getIsactives());
		params.put("where_id_in", sns);
		go_server_priceService.updateField(params);
		if("1".equals(serverPrice.getIsactives())){
			setSuccessMessage(model, "启用成功");
		}else{
			setSuccessMessage(model, "禁用成功");
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 删除
	 * @param model
	 * @param notice
	 * @param sns
	 * @return
	 */
	@RequestMapping("deletexx.htm")
	public String  deletexx(ModelMap model,Go_Server_Info serverInfo,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_server_priceService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
