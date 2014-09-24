package com.go.client.controller.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.main.service.IGo_Main_InfoService;
import com.go.controller.base.Go_BaseController;
import com.go.sys.section.model.Go_Company_Info;
import com.go.sys.section.service.IGo_Company_InfoService;
import com.go.sys.server.model.Go_Server_Info;
import com.go.sys.server.service.IGo_Server_InfoService;

/**
 * 服务器列表信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/main/*")
public class Go_Main_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_Main_InfoService go_main_infoService;//服务器信息service
	
	@Autowired
	private IGo_Company_InfoService go_company_infoService;//公司信息service
	@Autowired
	private IGo_Server_InfoService go_server_infoService;//服务器信息service
	
	/**
	 * 公共云服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="public.htm")
	public String publicCloudServer(ModelMap model){
		List<Map<String,Object>> list=go_main_infoService.getMapByType("1");//公有云服务器
		model.put("list", list);
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
	public String independenceServer(ModelMap model){
		List<Map<String,Object>> list=go_main_infoService.getMapByType("3");//独立服务器
		model.put("list", list);
		return "client/main/independenceServer";
	}
	
	/**
	 * 群站服务器列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="stations.htm")
	public String stationsGroupServer(ModelMap model){
		List<Map<String,Object>> list=go_main_infoService.getMapByType("4");//群站服务器
		model.put("list", list);
		return "client/main/stationsGroupServer";
	}
	
	/**
	 * linux VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="linux.htm")
	public String linuxVPS(ModelMap model){
		List<Map<String,Object>> list=go_main_infoService.getMapByType("6");//linux VPS
		model.put("list", list);
		return "client/main/linuxVPS";
	}
	
	/**
	 * windows VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="windows.htm")
	public String windowsVPS(ModelMap model){
		List<Map<String,Object>> list=go_main_infoService.getMapByType("5");//windows VPS
		model.put("list", list);
		return "client/main/windowsVPS";
	}
	
	/**
	 * HK VPS列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="HK.htm")
	public String hKVPS(ModelMap model){
		List<Map<String,Object>> list=go_main_infoService.getMapByType("7");//HK VPS
		model.put("list", list);
		return "client/main/HKVPS";
	}
	
	/**
	 * 每周特价列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="specialOffer.htm")
	public String specialOffer(ModelMap model){
		return "client/main/specialOffer";
	}
	
	/**
	 * 云解决方案列表查询
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="cloudSolutions.htm")
	public String cloudSolutions(ModelMap model){
		return "client/main/cloudSolutions";
	}
	
	/**
	 * 云托管
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="cloudHosting.htm")
	public String cloudHosting(ModelMap model){
		return "client/main/cloudHosting";
	}
	
	/**
	 * 服务托管
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="serverHosting.htm")
	public String serverHosting(ModelMap model){
		return "client/main/serverHosting";
	}
	
	/**
	 * 服务托管
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="managedServiecs.htm")
	public String managedServiecs(ModelMap model){
		return "client/main/managedServiecs";
	}
	
	/**
	 * 支持中心
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="support.htm")
	public String supportCenter(ModelMap model){
		return "client/main/supportCenter";
	}
	
	/**
	 * API文档
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="apiDocumentation.htm")
	public String apiDocumentation(ModelMap model){
		return "client/main/apiDocumentation";
	}
	
	/**
	 * 法律信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="legal.htm")
	public String legal(ModelMap model){
		return "client/main/legalInfo";
	}
	
	/**
	 * FAQs信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="faq.htm")
	public String faq(ModelMap model){
		return "client/main/faq";
	}
	
	/**
	 * 关于公司信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="company.htm")
	public String aboutCompany(ModelMap model){
		Go_Company_Info company=go_company_infoService.get(new HashMap<String,Object>());
		model.put("company", company);
		return "client/main/aboutCompany";
	}
	
	/**
	 * 技术伙伴信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="technology.htm")
	public String technologyPartners(ModelMap model){
		return "client/main/technologyPartners";
	}
	
}
