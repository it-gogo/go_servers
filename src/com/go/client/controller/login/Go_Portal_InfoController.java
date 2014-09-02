package com.go.client.controller.login;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "client/login/customerArea"; 
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
		if(password!=null && password.length()>0){
			portal_info.setPassword(Go_PasswordUtil.encrypt(password));
		}
		Map<String,Object> params= new HashMap<String, Object>();
		params.put("email", portal_info.getEmail());
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
			String email=portal_info.getEmail();
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
		return "client/login/customerArea"; 
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
