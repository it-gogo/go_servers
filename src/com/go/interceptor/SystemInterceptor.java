package com.go.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Repository 
public class SystemInterceptor  extends HandlerInterceptorAdapter{
	@Override  
    public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler) throws Exception {  
  
        request.setCharacterEncoding("UTF-8");  
        response.setCharacterEncoding("UTF-8");  
        response.setContentType("text/html;charset=UTF-8");  
  
        // 后台session控制  
        String[] noFilters = new String[] { "/sys/authority/menu/","/sys/authority/index/","/sys/common/","/sys/section/","/sys/server/",
        		"/sys/authority/index/","/sys/authority/menu/",};  
        String uri = request.getRequestURI();  
        if (uri.indexOf("htm") != -1) {  
            boolean beFilter = false;  
            for (String s : noFilters) {  
                if (uri.indexOf(s) != -1) {  
                    beFilter = true;  
                    break;  
                }  
            }  
            if (beFilter) {  
                Object obj = request.getSession().getAttribute("loginUser");  
                if (null == obj) {  
                	// 未登录  
                	String  requestType = request.getParameter("ajaxFlag");
                	if(requestType!=null&&requestType.equals("XMLHttpRequest")){
                		response.setContentType("text/html;charset=UTF-8");
            			response.setHeader("Pragma", "No-cache");
            			response.setHeader("Cache-Control", "no-cache");
            			response.setDateHeader("Expires", 0);
            			response.getWriter().write("unvalid");
            			response.getWriter().flush();
        				return false;
        			}
                	request.getRequestDispatcher("/sys/authority/user/sessionError.htm").forward(request, response);
                	return false;
                }
            }  
        }  
        return super.preHandle(request, response, handler);  
    }  
}
