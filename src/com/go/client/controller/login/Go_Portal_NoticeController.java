package com.go.client.controller.login;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.Go_BaseController;
import com.go.sys.section.model.Go_Notice_News;
import com.go.sys.section.service.IGo_NoticeService;

/**
 * 公告信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/notice")
public class Go_Portal_NoticeController extends Go_BaseController{
	
	@Autowired
	public IGo_NoticeService go_noticeService;
	
	
	/**
	 * 查看公告列表
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="notice.htm")
	public String notice(ModelMap model){
		List<Go_Notice_News> list=go_noticeService.list();
		System.out.println(list.size());
		model.put("list", list);
		return "client/login/notice";
	}
	
	/**
	 * 公告详情
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="detail.htm")
	public String detail(Go_Notice_News notice,ModelMap model){
		notice=go_noticeService.get(notice.getId());
		model.put("notice", notice);
		return "client/login/noticeDetail";
	}
	
	
}
