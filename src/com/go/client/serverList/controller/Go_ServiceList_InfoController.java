package com.go.client.serverList.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.serverList.service.IGo_ServerList_InfoService;
import com.go.controller.base.Go_BaseController;

/**
 * 服务器列表信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/serverList/*")
public class Go_ServiceList_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_ServerList_InfoService go_serverList_infoService;
	
	/**
	 * 公共云服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="public.htm")
	public String publicCloudServerList(Go_PageData pageData){
		return "client/main/publicCloudServerList";
	}
	
}
