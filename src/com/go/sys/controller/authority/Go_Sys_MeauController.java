package com.go.sys.controller.authority;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.Go_BaseController;
/**
 * 后台页面菜单
 * @author linyb
 * @create_time 2014-8-21下午10:03:42
 */
@Controller
@RequestMapping(value="/sys/authority/*")
public class Go_Sys_MeauController extends Go_BaseController{
	
	/**
	 * 后台主页
	 * @author linyb
	 * @create_time 2014-8-21下午10:05:19
	 */
	@RequestMapping(value="index.htm")
	public String main(ModelMap model){
		return "/main";
	}
}
