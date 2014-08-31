package com.go.controller.base;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * (项目基本框架类)
 * 控制层基类
 * @author it_gogo
 *
 */

public class Go_BaseController {
	protected Map<String, Object> sys_params;	// 查询参数
	protected String show_msg;					// 提示信息
	protected String error_msg;					// 错误信息
	protected List<String> show_msg_list;		// 多条提示信息
	protected List<String> error_msg_list;		// 多条错误信息
	protected HttpServletRequest request; 		// request请求
	public String getShow_msg() {
		return show_msg;
	}
	public void setShow_msg(String show_msg) {
		this.show_msg = show_msg;
	}
	public String getError_msg() {
		return error_msg;
	}
	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
	}
	
	
	
}
