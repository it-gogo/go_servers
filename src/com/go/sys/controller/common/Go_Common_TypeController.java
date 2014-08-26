package com.go.sys.controller.common;

import java.util.HashMap;
import java.util.Map;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.controller.base.Go_BaseController;
import com.go.sys.common.model.Go_Common_Type;
import com.go.sys.common.service.IGo_Common_TypeService;

/**
 * 数据字典类型控制器
 * @author zhangjf
 * @create_time 2014-8-25 下午10:17:08
 */
@Controller
@RequestMapping(value="/sys/common/data_type/*")
public class Go_Common_TypeController extends Go_BaseController {
	@Autowired
	private IGo_Common_TypeService go_common_typeService;
	/**
	 * 数据列表页面
	 * @author zhangjf
	 * @create_time 2014-8-25 下午10:19:46
	 * @param model
	 * @return
	 */
	@RequestMapping("list.htm")
	public String list(ModelMap model){
		return "sys/common/dict_type/query";
	}
	
	/**
	 * ajax请求获取数据列表
	 * @author zhangjf
	 * @create_time 2014-8-26 下午9:44:29
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("ajax_list.htm")
	public @ResponseBody Map ajax_list(HttpServletRequest request,ModelMap model,String name,Go_PageData pageData){
		Map<String,Object> params=new HashMap<String, Object>();
		if(StringUtils.isNotBlank(name)){
			params.put("name_like", name);
		}
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("rows", go_common_typeService.listPageByParams(params, pageData));
		map.put("total", pageData.getTotalSize());
		return map;
	}
	
	/**
	 * 数据字典类型添加操作
	 * @author zhangjf
	 * @create_time 2014-8-26 下午10:01:48
	 * @return
	 */
	@RequestMapping("add.htm")
	public String add(){
		return "sys/common/dict_type/editnew";
	}
	
	
	
	/**
	 * 数据字典类型编辑功能
	 * @author zhangjf
	 * @create_time 2014-8-26 下午9:46:16
	 * @param request
	 * @param common_type
	 * @return
	 */
	@RequestMapping("save.htm")
	public String save(HttpServletRequest request,Go_Common_Type common_type,ModelMap model){
		//1.进行数据完整性校验
		String result=common_type.validate();
		if(StringUtils.isBlank(result)){
			if(common_type.getId()!=null&&common_type.getId()>0){
				//修改操作
			}else{
				//新增操作
				common_type.setStatus(Go_Common_Type.STATUS_NORMAL);
				try {
					go_common_typeService.save(common_type);
					result="200";
				} catch (Exception e) {
					e.printStackTrace();
					result=e.getMessage();
				}
			}
		}//end validate
		setShow_msg(result);
		model.put("show_msg", show_msg);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	
	
}
