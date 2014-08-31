package com.go.client.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.main.service.IGo_Main_InfoService;
import com.go.controller.base.Go_BaseController;

/**
 * 服务器列表信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/main/*")
public class Go_Main_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_Main_InfoService go_serverList_infoService;
	
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
	 * linux VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="linux.htm")
	public String linuxVPS(Go_PageData pageData){
		return "client/main/linuxWindowsVPS";
	}
	
	/**
	 * windows VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="windows.htm")
	public String windowsVPS(Go_PageData pageData){
		return "client/main/linuxWindowsVPS";
	}
	
	/**
	 * HK VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="HK.htm")
	public String hKVPS(Go_PageData pageData){
		return "client/main/HKVPS";
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
	 * 云托管
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="cloudHosting.htm")
	public String cloudHosting(Go_PageData pageData){
		return "client/main/cloudHosting";
	}
	
	/**
	 * 服务托管
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="serverHosting.htm")
	public String serverHosting(Go_PageData pageData){
		return "client/main/serverHosting";
	}
	
	/**
	 * 服务托管
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="managedServiecs.htm")
	public String managedServiecs(Go_PageData pageData){
		return "client/main/managedServiecs";
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
	 * API文档
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="apiDocumentation.htm")
	public String apiDocumentation(Go_PageData pageData){
		return "client/main/apiDocumentation";
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
