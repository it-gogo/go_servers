package com.go.sys.controller.section;

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
import com.go.controller.base.Go_BaseController;
import com.go.sys.section.model.Go_Company_Info;
import com.go.sys.section.service.IGo_Company_InfoService;

/**
 * 公司信息控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/section/companyInfo/*")
public class Go_Company_InfoController extends Go_BaseController {

	@Autowired
	private IGo_Company_InfoService go_company_infoService;
	/**
	 * 初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(){
		return "sys/section/companyInfo/companyInfo";
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
				params.put(name+"_like", value);
			}
		}
		JSONObject  res = new JSONObject();
		List<Go_Company_Info> list=go_company_infoService.listPageByParams(params, pageData);
		res.put("total", pageData.getTotalSize());
		res.put("rows", JSONArray.fromObject(list));
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 新增操作页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "loadxx.htm")
	public String loadxx(Go_Company_Info companyInfo,ModelMap model){
		companyInfo=go_company_infoService.get(companyInfo.getId());
		JSONObject obj=JSONObject.fromObject(companyInfo);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Company_Info companyInfo){
		go_company_infoService.save(companyInfo);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 更新
	 * @param request
	 * @param model
	 * @param notice
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Company_Info companyInfo){
		Map<String, String[]> m=request.getParameterMap();
		String[] p=(String[]) m.get("content");
		String content="";
		if(p!=null && p.length>0){
			content=p[0];
		}
		p=(String[]) m.get("updateType");
		if(p!=null && p.length>0){
			String type=p[0];
			if("history".equals(type)){
				companyInfo.setHistory(content);
			}else if("corecompetitiveness".equals(type)){
				companyInfo.setCorecompetitiveness(content);
			}else if("briefintroduction".equals(type)){
				companyInfo.setBriefintroduction(content);
			}
		}
		go_company_infoService.update(companyInfo);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	/*@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Notice_News notice,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", notice.getIsactives());
		params.put("where_id_in", sns);
		go_noticeService.updateField(params);
		if("1".equals(notice.getIsactives())){
			setSuccessMessage(model, "启用成功");
		}else{
			setSuccessMessage(model, "禁用成功");
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}*/
	
	/**
	 * 删除
	 * @param model
	 * @param notice
	 * @param sns
	 * @return
	 */
	/*@RequestMapping("deletexx.htm")
	public String  deletexx(ModelMap model,Go_Notice_News notice,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_noticeService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}*/
}
