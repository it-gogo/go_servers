package com.go.sys.controller.server;

import java.text.ParseException;
import java.util.ArrayList;
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
import com.go.sys.common.model.Go_Code_Data;
import com.go.sys.common.service.IGo_Code_DataService;
import com.go.sys.server.model.Go_Server_Configuration;
import com.go.sys.server.model.Go_Server_Configuration_Type;
import com.go.sys.server.model.Go_Server_Info;
import com.go.sys.server.service.IGo_Configuration_DataService;
import com.go.sys.server.service.IGo_Server_ConfigurationService;
import com.go.sys.server.service.IGo_Server_Configuration_TypeService;
import com.go.sys.server.service.IGo_Server_InfoService;

/**
 * 套餐服务信息控制器
 * @author zhangjf
 * @create_time 2014-9-2 下午8:57:10
 */
@Controller
@RequestMapping("/sys/server/server_info/*")
public class Go_Server_InfoController extends Go_BaseController {

	@Autowired
	private IGo_Server_InfoService go_server_infoService;
	@Autowired
	private IGo_Configuration_DataService go_configuration_dataService;
	@Autowired
	private IGo_Server_Configuration_TypeService go_server_configuration_typeService;//关联表
	@Autowired
	private IGo_Server_ConfigurationService go_server_configurationService;//关联表
	@Autowired
	private IGo_Code_DataService go_code_dataService;//数据字典
	
	/**
	 * 可配置项树
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findConfigurationTree.htm")
	public  String  findConfigurationTree(ModelMap model){
		JSONArray  res = go_server_infoService.findConfigurationTree();
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 获取所有配置项数据
	 * @param model
	 * @param pageData
	 * @param gt_json
	 * @return
	 */
	@RequestMapping(value = "findAllConfigurationType.htm")
	public  String  findAllConfigurationType(ModelMap model,Go_PageData pageData,String gt_json){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("type", Constant.CODETYPE_KPZX);
		List<Go_Code_Data> list=go_code_dataService.list(params);
		JSONArray array=JSONArray.fromObject(list);
		JSONObject res=new JSONObject();
		res.put("total", go_code_dataService.count(params));
		res.put("rows", array);
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 查找绑定的可配置项
	 * @return
	 */
	@RequestMapping(value = "findConfiguration.htm")
	public  String  findConfiguration(ModelMap model,Go_PageData pageData,Integer id){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("server", id);
		List<Go_Server_Configuration> list=go_server_configurationService.list(params);
		JSONObject  obj = new JSONObject();
		for(int i=0;i<list.size();i++){
			Go_Server_Configuration po = list.get(i);
			Integer uids = po.getConfiguration();
			obj.put(uids,uids);
		}
//		model.addAttribute("show_msg",obj.toString());
		model.addAttribute("show_msg",JSONArray.fromObject(list).toString());
		System.out.println(JSONArray.fromObject(list).toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 绑定配置项
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "saveConfiguration.htm")
	public  String saveConfiguration(Go_Server_Info serverInfo,ModelMap model,String configuration){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("server", serverInfo.getId());
		go_server_configurationService.deleteList(params);
		List<Go_Server_Configuration> list=new ArrayList<Go_Server_Configuration>();
		String[] ids=configuration.split(",");
		for(int i=0;i<ids.length;i++){
			String str=ids[i];
			if("".equals(str)){
				continue;
			}
			str=str.trim();
			Integer id=Integer.valueOf(str);
			Go_Server_Configuration vo=new Go_Server_Configuration();
			vo.setConfiguration(id);
			vo.setServer(serverInfo.getId());
			list.add(vo);
			go_server_configurationService.save(vo);
		}
//		go_server_configuration_typeService.saveList(list);
		setSuccessMessage(model, "修改成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 服务器信息初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(){
		return "sys/server/info/serverInfo";
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
		List<Go_Server_Info> list=go_server_infoService.listPageByParams(params, pageData);
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
	public String loadxx(Go_Server_Info serverInfo,ModelMap model){
		serverInfo=go_server_infoService.get(serverInfo.getId());
		JSONObject obj=JSONObject.fromObject(serverInfo);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 服务器信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Server_Info serverInfo){
//		serverInfo.setType("公告");
//		serverInfo.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
		go_server_infoService.save(serverInfo);
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
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Server_Info serverInfo){
		go_server_infoService.update(serverInfo);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Server_Info serverInfo,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", serverInfo.getIsactives());
		params.put("where_id_in", sns);
		go_server_infoService.updateField(params);
		if("1".equals(serverInfo.getIsactives())){
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
		go_server_infoService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
