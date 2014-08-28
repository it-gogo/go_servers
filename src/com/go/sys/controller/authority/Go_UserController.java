package com.go.sys.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.base.module.Go_PageData;
import com.go.controller.base.Go_BaseController;
import com.go.sys.authority.model.Go_User;
import com.go.sys.authority.service.IGo_UserService;

/**
 * 后台用于管理 控制类
 * @author linyb
 * @create_time 2014-8-25下午9:08:48
 */
@Controller
@RequestMapping(value="/sys/authority/user/")
public class Go_UserController extends Go_BaseController{
	
	@Autowired
	private IGo_UserService go_userService;
	/**
	 * 后台用户列表页
	 * @author linyb
	 * @create_time 2014-8-25下午9:10:03
	 */
	@RequestMapping(value="list.htm")
	public String list(ModelMap model){
		return "/sys/authority/user/query";
	}
	/**
	 * 用户管理列表数据
	 * @author linyb
	 * @create_time 2014-8-25下午10:07:14
	 */
	@RequestMapping(value="ajax_list.htm" , produces="application/json")
	public @ResponseBody Map<String,Object> ajax_list(ModelMap model,String name,Go_PageData pageData){
		Map<String,Object> params = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(name)){
			params.put("name_like", name);
		}
		List<Go_User> rows = go_userService.listPageByParams(params, pageData);
		Map<String,Object> msg = new HashMap<String, Object>();
		msg.put("rows", rows);
		msg.put("total", pageData.getTotalSize());
		return msg;
	}
	@RequestMapping(value="add.htm")
	public String add(){
		
		return "/sys/authority/user/editnew";
	}
}
