package com.go.sys.controller.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.go.sys.common.service.IGo_Common_DataService;

/**
 * 数据字典数据控制器
 * @author zhangjf
 * @create_time 2014-8-27 下午11:00:31
 */
@Controller
@RequestMapping("/sys/common/dict_data/*")
public class Go_Common_DataController extends Go_BaseController {

	@Autowired
	private IGo_Common_DataService go_common_dataService;
	/**
	 * 数据字典数据列表页面
	 * @author zhangjf
	 * @create_time 2014-8-27 下午11:02:38
	 * @param model
	 * @return
	 */
	@RequestMapping("list.htm")
	public String list(ModelMap model){
		return "sys/common/dict_data/query";
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
		map.put("rows", go_common_dataService.listPageByParams(params, pageData));
		map.put("total", pageData.getTotalSize());
		return map;
	}
	
	/**
	 * 数据字典数据新增操作页面
	 * @author zhangjf
	 * @create_time 2014-8-27 下午11:38:16
	 * @return
	 */
	@RequestMapping("add.htm")
	public String add(){
		return "sys/common/dict_data/editnew";
	}
	
	@RequestMapping("edit.htm")
	public String eidt(ModelMap model,Integer id){
		if(id!=null){
			Go_Common_Data common_data=go_common_dataService.get(id);
			model.put("common_data", common_data);
		}
		return "sys/common/dict_data/editnew";
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
	public String save(ModelMap model,HttpServletRequest request,Go_Common_Data common_data){
		String result="";
		if(common_data!=null){
			 result=common_data.validate();
			if(StringUtils.isBlank(result)){
				try {
					//完整性校验通过
					if(common_data.getId()!=null&&common_data.getId()>0){
						//进行修改操作
						common_data.setUpdate_time(new SimpleDateFormat(Go_DateFormateUtil.FORMATE_TIME).format(new Date()));
						go_common_dataService.update(common_data);
					}else{
						//进行新增操作
						common_data.setStatus(Go_Common_Data.STATUS_NORMAL);
						common_data.setCreate_time(new SimpleDateFormat(Go_DateFormateUtil.FORMATE_TIME).format(new Date()));
						go_common_dataService.save(common_data);
					}
				} catch (Exception e) {
					result="系统异常";
				}//end try
				result="200";
			}else{
				result="操作错误";
			}//end数据完整性校验
		}else{
			result="操作错误";
		}//end common_data!=null
		setShow_msg(result);
		model.addAttribute("show_msg", show_msg);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
