package com.go.client.controller.login;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.base.constant.Go_ControllerConstant;
import com.go.base.module.Go_PageData;
import com.go.client.login.model.Go_Portal_Info;
import com.go.client.login.service.IGo_Portal_InfoService;
import com.go.client.util.DES;
import com.go.common.util.Go_PasswordUtil;
import com.go.controller.base.Go_BaseController;

/**
 * 门户信息 控制类
 * @author chenhb
 *
 */
@Controller
@RequestMapping(value="/client/login/portal")
public class Go_Portal_InfoController extends Go_BaseController{
	
	@Autowired
	public IGo_Portal_InfoService go_portal_infoService;
	
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
	 * 提交注册信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="save.htm")
	public String save(HttpServletRequest request,Go_Portal_Info portal_info,ModelMap model){
		String password=portal_info.getPassword();
		if(password!=null && password.length()>0){
			portal_info.setPassword(Go_PasswordUtil.encrypt(password));
		}
		portal_info=go_portal_infoService.save(portal_info);
		request.getSession().setAttribute("loginInfo", portal_info);
		model.addAttribute("portal_info",portal_info);
		return "redirect:/client/login/index/customerArea.htm";
	}
	
	/**
	 * 修改详细信息信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="modify.htm")
	public String modify(HttpServletRequest request,Go_Portal_Info portal_info,ModelMap model){
		go_portal_infoService.update(portal_info);
		request.getSession().setAttribute("loginInfo", portal_info);
		model.addAttribute("portal_info",portal_info);
		model.put("show_msg", "modify");
		return "client/login/myDetail"; 
	}
	
	/**
	 * 检测验证码
	 * @param code
	 * @return
	 */
	@RequestMapping(value="checkCode.htm")
	public String checkCode(HttpServletRequest request,String code,ModelMap model){
		String validateCode=(String) request.getSession().getAttribute("validateCode");
		JSONObject obj=new JSONObject();
		if(code==null || validateCode==null){//验证码为null或者输入验证码为null
			obj.put("status", 0);
			obj.put("msg","验证码错误!");
			model.addAttribute("show_msg", obj.toString());
			return Go_ControllerConstant.RESULT_SHOW_MSG;
		}
		validateCode=validateCode.toLowerCase();//验证码改成小写
		code=code.toLowerCase();//输入验证码改成小写
		if(validateCode.equals(code)){//比较两个小写字符串是否相同
			obj.put("status", 1);
			obj.put("msg","验证码正确!");
			model.addAttribute("show_msg", obj.toString());
		}else{
			obj.put("status", 0);
			obj.put("msg","验证码错误!");
			model.addAttribute("show_msg", obj.toString());
		}
		return Go_ControllerConstant.RESULT_SHOW_MSG;
	}
	
	/**
	 *去登陆页面
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="toLogin.htm")
	public String toLogin(HttpServletRequest request,ModelMap model){
		try{
			Cookie[] cookie=request.getCookies();
			for(int i=0;cookie!=null && i<cookie.length;i++){
				Cookie c=cookie[i];
				if("Go_Servers_Portal_Login_Cookie".equals(c.getName())){
					String str=c.getValue();
					str=DES.decrypt(str, DES.key);
					String[] arr=str.split(":");
					String email=arr[0];
					String pass=null;
					if(arr.length==2){
						pass=arr[1];
					}
					model.put("email", email);
					model.put("password", pass);
					model.put("rememberme", 1);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			return "404";
		}
		return "client/login/login"; 
	}
	
	/**
	 *登陆信息
	 * @param pageData
	 * @return
	 */
	@RequestMapping(value="login.htm")
	public String login(HttpServletRequest request,HttpServletResponse response,Go_Portal_Info portal_info,ModelMap model,String rememberme){
		String password=portal_info.getPassword();
		String email=portal_info.getEmail();
		if(email==null || "".equals(email) || password==null || "".equals(password)){
			error_msg="登录错误，请重试。";
			model.put("error_msg",error_msg);
			return "client/login/login"; 
		}
		portal_info.setPassword(Go_PasswordUtil.encrypt(password));
		Map<String,Object> params= new HashMap<String, Object>();
		params.put("email", email);
		params.put("password", portal_info.getPassword());
		portal_info=go_portal_infoService.get(params);
		if(portal_info==null){//门户不存在
			error_msg="登录错误，请重试。";
			model.put("error_msg",error_msg);
			return "client/login/login"; 
		}
		request.getSession().setAttribute("loginInfo", portal_info);
		model.addAttribute("portal_info",portal_info);
		
		//创建cookie保存登陆账号和密码
		Cookie c=null;
		if("1".equals(rememberme)){
			email=portal_info.getEmail();
			String str=email+":"+password;
			try{
				str=DES.encrypt(str, DES.key);
			}catch (Exception e) {
				e.printStackTrace();
				return "404";
			}
			c=new Cookie("Go_Servers_Portal_Login_Cookie",str);
			c.setMaxAge(60*60*24*14);
			c.setPath(request.getContextPath());
		}else{
			c=new Cookie("Go_Servers_Portal_Login_Cookie","");
			c.setMaxAge(0);
		}
		response.addCookie(c);
		return "redirect:/client/login/index/customerArea.htm";
	}
	
	/**
	 *退出
	 * @param request
	 * @return
	 */
	@RequestMapping(value="loginout.htm")
	public String loginout(HttpServletRequest request){
		request.getSession().invalidate();
		return "client/login/loginout"; 
	}
	
	/**
	 *我的详细信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="myDetail.htm")
	public String myDetail(HttpServletRequest request){
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		return "client/login/myDetail"; 
	}
	
	/**
	 *去更改密码页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toChangePassword.htm")
	public String toChangePassword(HttpServletRequest request){
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		return "client/login/changePassword"; 
	}
	
	/**
	 *更改密码
	 * @param request
	 * @return
	 */
	@RequestMapping(value="changePassword.htm")
	public String changePassword(HttpServletRequest request,String oldpw,String newpw,String newpw2,ModelMap model){
		Go_Portal_Info portal=(Go_Portal_Info) request.getSession().getAttribute("loginInfo");
		if(portal==null){
			return "redirect:/client/login/portal/toLogin.htm";
		}
		if(!portal.getPassword().equals(Go_PasswordUtil.encrypt(oldpw))){//密码有错
			show_msg="0";//当前密码错误
		}else if(newpw==null || "".equals(newpw)){
			show_msg="3";//请填写新密码
		}else if(!newpw.equals(newpw2)){
			show_msg="2";//当前密码错误
		}else{
			newpw=Go_PasswordUtil.encrypt(newpw);
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("update_password", newpw);
			params.put("where_id",portal.getId());
			go_portal_infoService.updateField(params);
			show_msg="1";//已成功保存更改
			portal.setPassword(newpw);
			request.getSession().setAttribute("loginInfo",portal);
		}
		model.put("show_msg", show_msg);
		return "client/login/changePassword"; 
	}
	
	
	/**
	 *重置密码
	 * @param request
	 * @return
	 */
	@RequestMapping(value="resetPassword.htm")
	public String resetPassword(){
		
		return "client/login/resetPassword"; 
	}
	
	/**
	 *发送邮件重置密码
	 * @param request
	 * @return
	 */
	@RequestMapping(value="sendEmail.htm")
	public String sendEmail(){
		
		return "client/login/sendSuccess"; 
	}
	
}
