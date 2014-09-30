package com.go.sys.controller.section;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.client.login.model.Go_Reply;
import com.go.client.login.service.IGo_ReplyService;
import com.go.client.login.service.IGo_TicketService;
import com.go.client.util.ExtendDate;
import com.go.controller.base.Go_BaseController;
import com.go.sys.authority.model.Go_User;

/**
 * 回复ticket信息控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/section/reply/*")
public class Go_ReplyController extends Go_BaseController {

	@Autowired
	private IGo_ReplyService go_replyService;
	@Autowired
	private IGo_TicketService go_ticketService;
	/**
	 * 初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(ModelMap model,int rowIndex,int tabIndex,int ticketid){
		model.put("rowIndex", rowIndex);
		model.put("tabIndex", tabIndex);
		model.put("ticketid", ticketid);
		return "sys/section/reply/reply";
	}
	
	/**
	 * 数据列表页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping("findlist.htm")
	public String findlist(ModelMap model,Go_PageData pageData,String gt_json){
		Map<String,Object> params= new HashMap<String, Object>();
		JSONArray arr=JSONArray.fromObject(gt_json);
		for(int i=0;i<arr.size();i++){
			JSONObject obj=arr.getJSONObject(i);
			String name=(String) obj.get("id");
			String value=(String) obj.get("vals");
			if(value!=null  &&  !"".equals(value)){
				params.put(name, value);
			}
		}
		JSONObject  res = new JSONObject();
		List<Go_Reply> list=go_replyService.listPageByParams(params, pageData);
		res.put("total", pageData.getTotalSize());
		res.put("rows", JSONArray.fromObject(list));
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 数据新增操作页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "loadxx.htm")
	public String loadxx(Go_Reply reply,ModelMap model){
		reply=go_replyService.get(reply.getId());
		JSONObject obj=JSONObject.fromObject(reply);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(HttpServletRequest request,ModelMap model,Go_Reply reply){
		Go_User loginUser=(Go_User) request.getSession().getAttribute("loginUser");
		reply.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
		reply.setIp(request.getLocalAddr());
		if(loginUser!=null){
			reply.setCreator(loginUser.getId());
			reply.setReplyname(loginUser.getName());
		}
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("update_isdispose", "管理员回复");
		params.put("where_id", reply.getTicketid());
		go_ticketService.updateField(params);
		go_replyService.save(reply);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 公告更新
	 * @param request
	 * @param model
	 * @param notice
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Reply reply){
		go_replyService.update(reply);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	
	/**
	 * 删除
	 * @param model
	 * @param notice
	 * @param sns
	 * @return
	 */
	@RequestMapping("deletexx.htm")
	public String  deletexx(ModelMap model,Go_Reply notice,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_replyService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
