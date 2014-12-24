package com.go.sys.controller.server;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.go.client.cart.model.Go_Order_Detail;
import com.go.client.cart.service.IGo_Order_DetailService;
import com.go.client.cart.service.IGo_Order_InfoService;
import com.go.client.util.ExtendDate;
import com.go.controller.base.Go_BaseController;

/**
 * 服务器订购详细信息控制器
 * @author zhangjf
 * @create_time 2014-9-2 下午8:57:10
 */
@Controller
@RequestMapping("/sys/server/server_detail/*")
public class Go_Server_DetailController extends Go_BaseController {

	@Autowired
	private IGo_Order_DetailService go_order_detailService;//订单详情信息service
	@Autowired
	private IGo_Order_InfoService go_order_infoService;//订单信息service
	
	
	/**
	 * 服务器信息初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(ModelMap model,int rowIndex,int tabIndex,int orderid){
		model.put("rowIndex", rowIndex);
		model.put("tabIndex", tabIndex);
		model.put("orderid", orderid);
		return "sys/server/detail/orderDetail";
	}
	
	/**
	 * 列表页面
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
//		List<Go_Order_Detail> list=go_order_detailService.listPageByParams(params, pageData);
		params.put("column","isfinish isfinish,id id,orderid orderid,server server,priceid priceid,servername servername,servertype servertype,cpu cpu,memory memory,disk disk,flow flow,ipNum ipNum,hostname hostname,ns1prefix ns1prefix,ns2prefix ns2prefix,rootpw rootpw,configuration configuration,price price,time time,quarter quarter,maturity maturity,createdate createdate,(select seq from Go_Order_Info where id=orderid) seq");
		List<Map<String,Object>> list=go_order_detailService.getScaleList(params);
		res.put("total", pageData.getTotalSize());
		res.put("rows", JSONArray.fromObject(list));
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 服务器信息新增操作页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "loadxx.htm")
	public String loadxx(Go_Order_Detail detail,ModelMap model){
		detail=go_order_detailService.get(detail.getId());
		JSONObject obj=JSONObject.fromObject(detail);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 服务器信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Order_Detail detail){
//		serverInfo.setType("公告");
//		serverInfo.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
		go_order_detailService.save(detail);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 服务器信息审核
	 * @author chenhb
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "checkxx.htm")
	public String checkxx(ModelMap model,Go_Order_Detail detail) throws Exception{
//		serverInfo.setType("公告");
//		serverInfo.setCreatedate(ExtendDate.getYMD_h_m_s(new Date()));
//		go_order_detailService.save(detail);
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("where_id", detail.getId());
		params.put("update_result", detail.getResult());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d=formatter.parse(detail.getCreatedate());
		int num=Integer.parseInt(detail.getTime());
		Calendar c=Calendar.getInstance();
		c.setTime(d);
		c.add(Calendar.MONTH, num);
		params.put("update_maturity", ExtendDate.getYMD_h_m_s(c));
		params.put("update_isfinish", "1");//完成
		go_order_detailService.updateField(params);
		
		params=new HashMap<String,Object>();
		params.put("id_<>", detail.getId());
		params.put("isfinish_<>", "1");
		int count=go_order_detailService.count(params);
		if(count==0){
			params=new HashMap<String,Object>();
			params.put("where_id", detail.getOrderid());
			params.put("update_status", "审核成功");
			params.put("update_seq", "3");
			go_order_infoService.updateField(params);
		}
		
		setSuccessMessage(model, "审核成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 服务器信息更新
	 * @param request
	 * @param model
	 * @param notice
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Order_Detail detail){
		go_order_detailService.update(detail);
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
	public String  deletexx(ModelMap model,Go_Order_Detail detail,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_order_detailService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
}
