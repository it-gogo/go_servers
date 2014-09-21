package com.go.sys.controller.common;

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
import com.go.sys.common.model.Go_Code_Data;
import com.go.sys.common.service.IGo_Code_DataService;

/**
 * 数据字典控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/common/data/*")
public class Go_Code_DataController extends Go_BaseController {

	@Autowired
	private IGo_Code_DataService go_code_dataService;
	
	/**
	 * 数据类型树
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getCodeTree.htm")
	public  String  getCodeTree(ModelMap model){
		JSONArray  res = go_code_dataService.getCodeTree();
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
		return "sys/common/data/data";
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
			if(value!=null  &&  !"".equals(value)){
				params.put(name+"_like", value);
			}
		}
		JSONObject  res = new JSONObject();
		List<Go_Code_Data> list=go_code_dataService.listPageByParams(params, pageData);
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
	public String loadxx(Go_Code_Data data,ModelMap model){
		data=go_code_dataService.get(data.getId());
		JSONObject obj=JSONObject.fromObject(data);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Code_Data data){
		go_code_dataService.save(data);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 *更新
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Code_Data data){
		go_code_dataService.update(data);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Code_Data data,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", data.getIsactives());
		params.put("where_id_in", sns);
		go_code_dataService.updateField(params);
		if("1".equals(data.getIsactives())){
			setSuccessMessage(model, "启用成功");
		}else{
			setSuccessMessage(model, "禁用成功");
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 删除
	 * @param model
	 * @param data
	 * @param sns
	 * @return
	 */
	@RequestMapping("deletexx.htm")
	public String  deletexx(ModelMap model,Go_Code_Data data,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_code_dataService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
