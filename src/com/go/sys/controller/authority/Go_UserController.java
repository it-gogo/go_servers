package com.go.sys.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.common.util.Go_StringUtil;
import com.go.controller.base.Go_BaseController;
import com.go.sys.authority.model.Go_User;
import com.go.sys.authority.service.IGo_UserService;

/**
 * 后台用于管理 控制类
 * @author linyb
 * @create_time 2014-8-25下午9:08:48
 */
@Controller
@RequestMapping(value="/sys/authority/user/")
public class Go_UserController extends Go_BaseController{
	
	@Autowired
	private IGo_UserService go_userService;
	/**
	 * 后台用户列表页
	 * @author linyb
	 * @create_time 2014-8-25下午9:10:03
	 */
	@RequestMapping(value="list.htm")
	public String list(ModelMap model){
		return "/sys/authority/user/query";
	}
	/**
	 * 用户管理列表数据
	 * @author linyb
	 * @create_time 2014-8-25下午10:07:14
	 */
	@RequestMapping(value="ajax_list.htm" , produces="application/json")
	public @ResponseBody Map<String,Object> ajax_list(ModelMap model,String name,Go_PageData pageData){
		Map<String,Object> sys_params = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(name)){
			sys_params.put("name_like", name);
		}
		List<Go_User> rows = go_userService.listPageByParams(sys_params, pageData);
		
		Map<String,Object> msg = new HashMap<String, Object>();
		msg.put("rows", rows);
		msg.put("total", pageData.getTotalSize());
		return msg;
	}
	/**
	 * 增加用户
	 * @author linyb
	 * @create_time 2014-8-28下午9:37:26
	 */
	@RequestMapping(value="add.htm")
	public String add(){
		return "/sys/authority/user/editnew";
	}
	@RequestMapping(value="edit.htm")
	public String edit(ModelMap model ,Integer id){
		Go_User user = go_userService.get(id);
		model.addAttribute("go_user", user);
		return "/sys/authority/user/editnew";
	}
	/**
	 * 增加或者修改后台用户的信息
	 * @author linyb
	 * @create_time 2014-8-31上午9:45:39
	 */
	@RequestMapping(value="save.htm")
	public String save(Go_User go_user,ModelMap model){
		String msg = "200";
		msg = go_user.validate();
		if("200".equals(msg)){
			try {
				if(go_user.getId() != null){
				  	//修改
					go_userService.update(go_user);
				}else{
					//新增
					go_user.setStatus(Go_User.USER_STATUS_OK);
					go_user.setPassword(Go_StringUtil.encrypt(go_user.getPassword()));
					go_userService.save(go_user);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "系统出错！";
			}
		}
		model.addAttribute("show_msg", msg);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/*
	 * 去登陆页面
	 * @return
	 */
	@RequestMapping(value="toLogin.htm")
	public String toLogin(HttpServletRequest request){
		request.getSession().invalidate();
		return "/sys/login";
	}
	/**
	 * 登陆
	 * @return
	 */
	@RequestMapping(value="login.htm")
	public String login(ModelMap model,Go_User user){
		model.addAttribute("show_msg",1);
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping(value="modifypass.htm")
	public String modifypass(){
		return "/sys/authority/user/modifypassEdit";
	}
	/**
	 * 提交修改密码
	 * @return
	 */
	@RequestMapping(value="updatePass.htm")
	public String updatePass(ModelMap model){
		setSuccessMessage(model, "密码修改成功");
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	/**
	 * 启用用户
	 * @author linyb
	 * @create_time 2014-9-24下午11:38:41
	 */
	@RequestMapping(value="ok_status.htm",produces="application/json")
	public @ResponseBody String ok_status(ModelMap model,Integer id){
		try {
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("update_sttaus", Go_User.USER_STATUS_OK);
			params.put("where_id", id);
			go_userService.updateField(params);
			return "启用成功！";
		} catch (Exception e) {
			e.printStackTrace();
			return "系统出错！";
		}
	}
}
