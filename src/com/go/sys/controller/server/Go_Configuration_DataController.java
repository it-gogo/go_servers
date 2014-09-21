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
import com.go.sys.authority.model.Constant;
import com.go.sys.common.service.IGo_Code_DataService;
import com.go.sys.server.model.Go_Configuration_Data;
import com.go.sys.server.service.IGo_Configuration_DataService;

/**
 * 可配置数据控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/server/configuration/*")
public class Go_Configuration_DataController extends Go_BaseController {

	@Autowired
	private IGo_Configuration_DataService go_configuration_dataService;
	@Autowired
	private IGo_Code_DataService go_code_dataService;
	
	/**
	 * 可配置类型树
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getConfigurationTree.htm")
	public  String  getConfigurationTree(ModelMap model){
		JSONArray  res = go_code_dataService.getCodeTreeByType(Constant.CODETYPE_KPZX);
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	 
	
	/**
	 * 公告初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(){
		return "sys/server/configuration/configuration";
	}
	
	/**
	 * 数据列表页面
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
			String datatype=(String) obj.get("datatype");
			if(value!=null  &&  !"".equals(value)){
				if("integer".equals(datatype) || "long".equals(datatype)){
					params.put(name, value);
				}else{
					params.put(name+"_like", value);
				}
			}
		}
		JSONObject  res = new JSONObject();
		List<Go_Configuration_Data> list=go_configuration_dataService.listPageByParams(params, pageData);
		res.put("total", pageData.getTotalSize());
		res.put("rows", JSONArray.fromObject(list));
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 公告数据新增操作页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "loadxx.htm")
	public String loadxx(Go_Configuration_Data configuration,ModelMap model){
		configuration=go_configuration_dataService.get(configuration.getId());
		JSONObject obj=JSONObject.fromObject(configuration);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Configuration_Data configuration){
		go_configuration_dataService.save(configuration);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 *更新
	 * @param request
	 * @param model
	 * @param configuration
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Configuration_Data configuration){
		go_configuration_dataService.update(configuration);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Configuration_Data configuration,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", configuration.getIsactives());
		params.put("where_id_in", sns);
		go_configuration_dataService.updateField(params);
		if("1".equals(configuration.getIsactives())){
			setSuccessMessage(model, "启用成功");
		}else{
			setSuccessMessage(model, "禁用成功");
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 删除
	 * @param model
	 * @param configuration
	 * @param sns
	 * @return
	 */
	@RequestMapping("deletexx.htm")
	public String  deletexx(ModelMap model,Go_Configuration_Data configuration,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_configuration_dataService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
