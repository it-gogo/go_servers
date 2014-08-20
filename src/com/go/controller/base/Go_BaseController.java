package com.go.controller.base;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * (项目基本框架类)
 * 控制层基类
 * @author it_gogo
 *
 */
@Controller
@RequestMapping(value="/test/*")
public class Go_BaseController {
	protected Map<String, Object> sys_params;	// 查询参数
	protected String show_msg;					// 提示信息
	protected String error_msg;					// 错误信息
	protected List<String> show_msg_list;		// 多条提示信息
	protected List<String> error_msg_list;		// 多条错误信息
	protected HttpServletRequest request; 		// request请求
	
	/**
	 * 项目框架测试能否运行
	 * @return
	 */
	@RequestMapping(value="test.htm")
	public String index(){
		return "/index/index";
	}
}
