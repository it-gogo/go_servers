package com.go.client.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.main.service.IGo_Login_InfoService;
import com.go.controller.base.Go_BaseController;

/**
 * 服务器列表信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/*")
public class Go_Login_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_Login_InfoService go_Login_infoService;
	
	/**
	 * 注册信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="registration.htm")
	public String registration(Go_PageData pageData){
		return "client/login/registration";
	}
	
	/**
	 *登陆信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="login.htm")
	public String login(Go_PageData pageData){
		return "client/login/login";
	}
	
	/**
	 * 门店主页面
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="index.htm")
	public String index(Go_PageData pageData){
		return "client/login/index";
	}
	
	/**
	 * 客户区
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="customerArea.htm")
	public String customerArea(Go_PageData pageData){
		return "client/login/customerArea";
	}
	
	/**
	 *公告信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="notice.htm")
	public String notice(Go_PageData pageData){
		return "client/login/notice";
	}
	
	/**
	 * 知识库
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="knowledge.htm")
	public String knowledge(Go_PageData pageData){
		return "client/login/knowledge";
	}
	
	/**
	 * 提交ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="ticket.htm")
	public String ticket(Go_PageData pageData){
		return "client/login/ticket";
	}
	
	/**
	 * 下载
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="dowmload.htm")
	public String dowmload(Go_PageData pageData){
		return "client/login/dowmload";
	}
	
	/**
	 * Afiliates
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="affiliates.htm")
	public String affiliates(Go_PageData pageData){
		return "client/login/affiliates";
	}
	
	/**
	 * 域名检信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="demain.htm")
	public String demain(Go_PageData pageData){
		return "client/login/demain";
	}
	
	/**
	 * 网络问题信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="networkProblems.htm")
	public String networkProblems(Go_PageData pageData){
		return "client/login/networkProblems";
	}
	
	/**
	 * 售前联系
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="proContant.htm")
	public String proContant(Go_PageData pageData){
		return "client/login/pro-contant";
	}
	
	/**
	 * 服务器状态
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="serverStatus.htm")
	public String serverStatus(Go_PageData pageData){
		return "client/login/serverStatus";
	}
	
}
