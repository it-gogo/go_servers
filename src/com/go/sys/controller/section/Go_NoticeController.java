package com.go.sys.controller.section;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.common.util.Go_DateFormateUtil;
import com.go.controller.base.Go_BaseController;
import com.go.sys.common.model.Go_Common_Data;
import com.go.sys.section.model.Go_Notice;
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
	 * 数据字典管理
	 * @author zhangjf
	 * @version 2.0
	 * @create_date 2014-4-24 下午3:24:06
	 * @return
	 */
	@RequestMapping(value = "dict_data.htm")
	public String dict_data(){
		return "sys/section/notice/dict_data";
	}
	
	/**
	 * 数据字典数据列表页面
	 * @author zhangjf
	 * @create_time 2014-8-27 下午11:02:38
	 * @param model
	 * @return
	 */
	@RequestMapping("list.htm")
	public String list(ModelMap model){
		return "sys/section/notice/query";
	}
	
	/**
	 * ajax请求获取列表数据
	 * @author zhangjf
	 * @create_time 2014-8-27 下午11:03:43
	 * @param request
	 * @param model
	 * @param name
	 * @return
	 */
	@RequestMapping("ajax_list.htm")
	public @ResponseBody Map ajax_list(HttpServletRequest request,ModelMap model,String name,Go_PageData pageData){
		Map<String,Object> params= new HashMap<String, Object>();
		params.put("status", Go_Common_Data.STATUS_NORMAL);
		if(StringUtils.isNotBlank(name)){
			params.put("name_like", name);
		}
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("rows", go_noticeService.listPageByParams(params, pageData));
		map.put("total", pageData.getTotalSize());
		return map;
	}
	
	/**
	 * 数据字典数据新增操作页面
	 * @author zhangjf
	 * @create_time 2014-8-27 下午11:38:16
	 * @return
	 */
	@RequestMapping(value = "add.htm")
	public String add(ModelMap model,Integer type_id){
		Go_Notice notice = new Go_Notice();
		//notice.setType_id(type_id);
		model.put("notice", notice);
		return "sys/section/notice/editnew";
	}
	
	@RequestMapping("edit.htm")
	public String eidt(ModelMap model,Integer id){
		if(id!=null){
			Go_Notice notice=go_noticeService.get(id);
			model.put("notice", notice);
		}
		return "sys/section/notice/editnew";
	}
	
	/**
	 * 返回详细页面
	 * @author zhangjf
	 * @create_time 2014-8-28 下午9:21:01
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail.htm")
	public String detail(ModelMap model,Integer id){
		if(id != null)
			model.addAttribute("notice", go_noticeService.get(id));
		return "sys/section/notice/detail";
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
	public String save(ModelMap model,HttpServletRequest request,Go_Notice notice){
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
