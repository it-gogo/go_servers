package com.go.sys.controller.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.Go_BaseController;
import com.go.sys.authority.service.IGo_MenuService;

/**
 * 后台index控制类
 * @author linyb
 * @create_time 2014-8-25下午9:53:48
 */
@Controller
@RequestMapping(value="/sys/authority/index/*")
public class Go_IndexController extends Go_BaseController{
	@Autowired
	private IGo_MenuService go_menuService;
	
	@RequestMapping(value="main.htm")
	public String main(ModelMap model){
		String menuStr=go_menuService.getMenuStr();
		model.put("menuStr", menuStr);
		return "/sys/main";
	}
}


