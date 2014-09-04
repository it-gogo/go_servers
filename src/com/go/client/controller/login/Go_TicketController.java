package com.go.client.controller.login;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.client.login.model.Go_Ticket;
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
public class Go_TicketController extends Go_BaseController{
	
	@Autowired
	public IGo_TicketService go_ticketService;
	
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
//		 MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;  
//         //  获得第1张图片（根据前台的name名称得到上传的文件）   
//         MultipartFile imgFile1  =  multipartRequest.getFile("attachaddress");
//         String url=ticket.getAttachaddress();
//         File file=new File("d://test.jpg");
//         try {
//			imgFile1.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
         ticket.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));//创建时间
         ticket.setIp(request.getRemoteAddr());
		ticket=go_ticketService.save(ticket);
		model.put("ticket", ticket);
		return "client/login/submitTicketSuccess";
	}
	
	/**
	 * 察看ticket
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="look.htm")
	public String look(Go_Ticket ticket,ModelMap model){
		ticket=go_ticketService.get(ticket.getId());
		model.put("ticket", ticket);
		return "client/login/lookTicket";
	}
	
}
