package com.go.sys.controller.section;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.client.util.ExtendDate;
import com.go.controller.base.Go_BaseController;
import com.go.sys.common.model.Go_Common_Data;
import com.go.sys.section.model.Go_Notice_News;
import com.go.sys.section.service.IGo_NoticeService;

/**
 * 公告信息控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/section/notice/*")
public class Go_NoticeController extends Go_BaseController {

	@Autowired
	private IGo_NoticeService go_noticeService;
	/**
	 * 公告初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(){
		return "sys/section/notice/notice";
	}
	
	/**
	 * 公告数据列表页面
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
		List<Go_Notice_News> list=go_noticeService.listPageByParams(params, pageData);
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
	public String loadxx(Go_Notice_News notice,ModelMap model){
		notice=go_noticeService.get(notice.getId());
		JSONObject obj=JSONObject.fromObject(notice);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 公告信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Notice_News notice){
		notice.setType("公告");
		notice.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
		go_noticeService.save(notice);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 公告更新
	 * @param request
	 * @param model
	 * @param notice
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Notice_News notice){
		go_noticeService.update(notice);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Notice_News notice,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", notice.getIsactives());
		params.put("where_id_in", sns);
		go_noticeService.updateField(params);
		if("1".equals(notice.getIsactives())){
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
	public String  deletexx(ModelMap model,Go_Notice_News notice,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_noticeService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 数据字典删除操作
	 * @author zhangjf
	 * @create_time 2014-8-28 下午9:29:37
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete.htm")
	public String delete(ModelMap model,Integer id){
		Map<String,Object>params=null;
		if(id != null){
			setShow_msg("200");
			try{
				params=new HashMap<String, Object>();
				//params.put("update_status", Go_Common_Data.STATUS_DEL);
				params.put("where_id", id);
				go_noticeService.updateField(params);
			}catch (Exception e) {
				setShow_msg("删除出问题了!<br> <strong>错误信息</strong>：" + e.getMessage());
				e.printStackTrace();
			}
			model.addAttribute("show_msg",show_msg);
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	
	/**
	 * 进行数据字典数据保存
	 * @author zhangjf
	 * @create_time 2014-8-27 下午11:07:43
	 * @param model
	 * @param request
	 * @param common_data
	 * @return
	 */
	@RequestMapping("save.htm")
	public String save(ModelMap model,HttpServletRequest request,Go_Notice_News notice){
		String result="";
		setShow_msg(result);
		model.addAttribute("show_msg", show_msg);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * ajax请求类型数据
	 * @author zhangjf
	 * @create_time 2014-8-28 下午9:22:14
	 * @param request
	 * @param model
	 * @param type_id
	 * @param name
	 * @return
	 */
	@RequestMapping(value="type_ajax_list.htm")
	public @ResponseBody Map type_ajax_list(HttpServletRequest request,ModelMap model,Integer type_id,String name){
		if(type_id!=null&&type_id>0){
			//条件参数
			sys_params=new HashMap<String, Object>();
			sys_params.put("type_id", type_id);
			sys_params.put("status", Go_Common_Data.STATUS_NORMAL);
			//添加数据权限的条件约束
			if(request.getAttribute("check_where")!=null){
				sys_params.put("check_where", request.getAttribute("check_where"));
			}
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("rows", go_noticeService.list(sys_params));
			map.put("total", "0");
			return map;
		}
		return null;
	}
	
	/**
	 * 根据数据字典类型表达式获取字典数据
	 * @author zhangjf
	 * @create_time 2014-9-2 下午10:33:27
	 * @param request
	 * @param extension
	 * @return
	 */
	@RequestMapping(value="ajax_combo_list.htm")
	public @ResponseBody List<Go_Common_Data> ajax_combo_list(HttpServletRequest request,String extension){
		List<Go_Common_Data> datas=new ArrayList<Go_Common_Data>();
		if(StringUtils.isNotBlank(extension)){
			Map<String,Object> params=new HashMap<String, Object>();
			params.put("extension", extension);
		}
		return datas;
	}
	
}
