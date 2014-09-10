package com.go.client.controller.login;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.module.Go_PageData;
import com.go.client.core.PageBean;
import com.go.client.login.model.Go_Reply;
import com.go.client.login.model.Go_Ticket;
import com.go.client.login.service.IGo_ReplyService;
import com.go.client.login.service.IGo_TicketService;
import com.go.client.util.ExtendDate;
import com.go.controller.base.Go_BaseController;

/**
 * ticket信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/ticket")
public class Go_Portal_TicketController extends Go_BaseController{
	
	@Autowired
	public IGo_TicketService go_ticketService;
	@Autowired
	public IGo_ReplyService go_replyService;//回复ticket Service
	
	/**
	 * 去添加ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="toAdd.htm")
	public String toAdd(){
		return "client/login/submitticket";
	}
	
	/**
	 * 添加ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="save.htm")
	public String save(HttpServletRequest request,Go_Ticket ticket,ModelMap model){
         ticket.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));//创建时间
         ticket.setIp(request.getRemoteAddr());
         ticket.setIsdispose("打开");
		ticket=go_ticketService.save(ticket);
		model.put("ticket", ticket);
		return "client/login/submitTicketSuccess";
	}
	
	/**
	 * 关闭ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="close.htm")
	public String close(Go_Ticket ticket,ModelMap model){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("update_isdispose", "关闭");
		params.put("where_id", ticket.getId());
		go_ticketService.updateField(params);
		return "redirect:/client/login/ticket/look.htm?id="+ticket.getId();
	}
	
	/**
	 * 察看ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="look.htm")
	public String look(Go_Ticket ticket,ModelMap model){
		ticket=go_ticketService.get(ticket.getId());
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("ticketid",ticket.getId());
		List<Go_Reply> list=go_replyService.list(params);
		ticket.setList(list);
		model.put("ticket", ticket);
		return "client/login/lookTicket";
	}
	
	/**
	 * 服务ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="support.htm")
	public String support(Go_PageData pageData,Go_Ticket ticket,ModelMap model){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("isdispose_<>","关闭");
//		pageData.setPageSize(2);
		List<Go_Ticket> list=go_ticketService.listPageByParams(params, pageData);
		int allRow=go_ticketService.count(params);
		
		PageBean<Go_Ticket> pb=new PageBean<Go_Ticket>();
		pb.setPageSize(pageData.getPageSize());
		pb.setCurentPage(pageData.getCurrentPage());
		pb.setAllRow(allRow);
		pb.setTotalPage(pb.countTotalPage());
		pb.setList(list);
		list.size();
		model.put("pb", pb);
		
		return "client/login/supportticket";
	}
	
}
