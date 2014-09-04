package com.go.client.controller.login;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.client.login.model.Go_Reply;
import com.go.client.login.model.Go_Ticket;
import com.go.client.login.service.IGo_ReplyService;
import com.go.client.util.ExtendDate;
import com.go.controller.base.Go_BaseController;

/**
 * 回复ticket信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/reply")
public class Go_ReplyController extends Go_BaseController{
	
	@Autowired
	public IGo_ReplyService go_replyService;
	
	
	
	/**
	 * 回复ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="save.htm")
	public String save(HttpServletRequest request,Go_Reply reply,ModelMap model){
		reply.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));//创建时间
		reply.setIp(request.getRemoteAddr());
		reply=go_replyService.save(reply);
		model.put("reply", reply);
		return "client/login/lookTicket";
	}
	
	
}
