package com.go.sys.controller.authority;

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
import com.go.sys.authority.model.Go_Menu;
import com.go.sys.authority.service.IGo_MenuService;

/**
 * 菜单信息控制器
 * @author chenhb
 */
@Controller
@RequestMapping("/sys/authority/menu/*")
public class Go_MenuController extends Go_BaseController {

	@Autowired
	private IGo_MenuService go_menuService;
	/**
	 * 公告初始化
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "redirect.htm")
	public String redirect(){
		return "sys/authority/menu/menu";
	}
	
	/**
	 * 公告数据列表页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping("findlist.htm")
	public String findlist(ModelMap model,Go_PageData pageData,String gt_json){
		Map<String,Object> params= new HashMap<String, Object>();
//		params.put("isactives", "1");
		JSONArray arr=JSONArray.fromObject(gt_json);
		for(int i=0;i<arr.size();i++){
			JSONObject obj=arr.getJSONObject(i);
			String name=(String) obj.get("id");
			String value=(String) obj.get("vals");
//			String datatype=(String)obj.get("datatype");
			if(value!=null  &&  !"".equals(value)){
				params.put(name+"_like", value);
			}
		}
		JSONObject  res = new JSONObject();
		List<Go_Menu> list=go_menuService.listPageByParams(params, pageData);
		
		//List<Go_Menu> list=go_menuService.listByPage(pageData);
		res.put("total", pageData.getTotalSize());
		res.put("rows", JSONArray.fromObject(list));
		model.addAttribute("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 公告数据新增操作页面
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "loadxx.htm")
	public String loadxx(Go_Menu menu,ModelMap model){
		menu=go_menuService.get(menu.getId());
		JSONObject obj=JSONObject.fromObject(menu);
		
		String pName = "";
		String parentnumber=menu.getParentnumber();
		if(!"0".equals(parentnumber)){
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("column", "name");
			params.put("number", parentnumber);
		   pName =(String) go_menuService.getScale(params);
		}else{
		   pName = "系统菜单";
		}
		obj.put("pname", pName);
		model.addAttribute("show_msg",obj.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 公告信息保存
	 * @author chenhb
	 * @return
	 */
	@RequestMapping(value = "addxx.htm")
	public String addxx(ModelMap model,Go_Menu menu){
		int res = 0;
		//创建排序信息
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("column", "max(seq)");
		Integer seq = (Integer) go_menuService.getScale(params);//获得最大seq
		if(seq==null){
			seq=0;
		}
		seq+=1;
		int fbh = 0;//父编号
		if(menu.getParentnumber()!=null){
			fbh = Integer.parseInt(menu.getParentnumber());
		}
		params.put("column", "max(number)");
		params.put("parentnumber", menu.getParentnumber());
		String numberStr=(String) go_menuService.getScale(params);//获得同一个父类里面最大的number
		 int  number = 100;
		if(numberStr!=null){
			number=Integer.parseInt(numberStr);
			number+=1;
		}else{
			number=new Integer(fbh+String.valueOf(number));
		}
		
		
		menu.setSeq(seq);
		menu.setStep( String.valueOf(number).length()/3);
		menu.setParentnumber(String.valueOf(fbh));
		menu.setNumber(String.valueOf(number));
		go_menuService.save(menu);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 公告更新
	 * @param request
	 * @param model
	 * @param menu
	 * @return
	 */
	@RequestMapping("updatexx.htm")
	public String updatexx(HttpServletRequest request,ModelMap model,Go_Menu menu){
		go_menuService.update(menu);
		setSuccessMessage(model, "保存成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 启用禁用
	 * @return
	 */
	@RequestMapping("changestat.htm")
	public  String changestat(ModelMap model,Go_Menu menu,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("update_isactives", menu.getIsactives());
		params.put("where_id_in", sns);
		go_menuService.updateField(params);
		if("1".equals(menu.getIsactives())){
			setSuccessMessage(model, "启用成功");
		}else{
			setSuccessMessage(model, "禁用成功");
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 删除
	 * @param model
	 * @param menu
	 * @param sns
	 * @return
	 */
	@RequestMapping("deletexx.htm")
	public String  deletexx(ModelMap model,Go_Menu menu,String sns){
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("id_in", sns);
		go_menuService.deleteList(params);
		setSuccessMessage(model, "删除成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 创建菜单树
	 * @param model
	 * @return
	 */
	@RequestMapping("findMenuTree.htm")
	public  String  findMenuTree(ModelMap model){
		JSONArray  res = go_menuService.findMenuTree();
		model.put("show_msg",res.toString());
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
}
