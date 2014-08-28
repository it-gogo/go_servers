package com.go.client.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.main.service.IGo_ServerList_InfoService;
import com.go.controller.base.Go_BaseController;

/**
 * 服务器列表信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/main/*")
public class Go_ServiceList_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_ServerList_InfoService go_serverList_infoService;
	
	/**
	 * 公共云服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="public.htm")
	public String publicCloudServer(Go_PageData pageData){
		return "client/main/publicCloudServer";
	}
	
	/**
	 * 私有云服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="private.htm")
	public String privateCloudServer(Go_PageData pageData){
		return "client/main/privateCloudServer";
	}
	
	/**
	 * 独立服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="independence.htm")
	public String independenceServer(Go_PageData pageData){
		return "client/main/independenceServer";
	}
	
	/**
	 * 群站服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="stations.htm")
	public String stationsGroupServer(Go_PageData pageData){
		return "client/main/stationsGroupServer";
	}
	
	/**
	 * linux/windows VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="linuxWindows.htm")
	public String linuxWindowsVPS(Go_PageData pageData){
		return "client/main/linuxWindowsVPS";
	}
	
	/**
	 * 每周特价列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="specialOffer.htm")
	public String specialOffer(Go_PageData pageData){
		return "client/main/specialOffer";
	}
	
	/**
	 * 云解决方案列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="cloudSolutions.htm")
	public String cloudSolutions(Go_PageData pageData){
		return "client/main/cloudSolutions";
	}
	
	/**
	 * 支持中心
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="support.htm")
	public String supportCenter(Go_PageData pageData){
		return "client/main/supportCenter";
	}
	
	/**
	 * 法律信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="legal.htm")
	public String legal(Go_PageData pageData){
		return "client/main/legalInfo";
	}
	
	/**
	 * FAQs信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="faq.htm")
	public String faq(Go_PageData pageData){
		return "client/main/faq";
	}
	
	/**
	 * 关于公司信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="company.htm")
	public String aboutCompany(Go_PageData pageData){
		return "client/main/aboutCompany";
	}
	
	/**
	 * 技术伙伴信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="technology.htm")
	public String technologyPartners(Go_PageData pageData){
		return "client/main/technologyPartners";
	}
	
}
