package com.go.sys.controller.server;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.Go_BaseController;

/**
 * 套餐服务信息控制器
 * @author zhangjf
 * @create_time 2014-9-2 下午8:57:10
 */
@Controller
@RequestMapping("/sys/server/server_info/*")
public class Go_Server_InfoController extends Go_BaseController {

	/**
	 * 跳转到套餐列表页面
	 * @author zhangjf
	 * @create_time 2014-9-2 下午8:58:19
	 * @return
	 */
	@RequestMapping(value="list.htm")
	public String list(){
		return "sys/server/info/query";
	}
	/**
	 * 跳转到套餐添加页面
	 * @author zhangjf
	 * @create_time 2014-9-2 下午9:33:19
	 * @return
	 */
	@RequestMapping(value="add.htm")
	public String add(){
		return "sys/server/info/add";
	}
}
