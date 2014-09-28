package com.go.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.go.sys.section.model.Go_Company_Info;
import com.go.sys.section.service.IGo_Company_InfoService;

public class Company  implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
//		WebApplicationContext rwp = WebApplicationContextUtils.getRequiredWebApplicationContext(arg0.getServletContext());
//		IGo_Company_InfoService go_company_infoService= (IGo_Company_InfoService)rwp.getBean("Go_Company_InfoService");
//		Map<String,Object> params=new HashMap<String,Object>();
//		Go_Company_Info companyInfo=go_company_infoService.get(params);
//		System.out.println("companyInfo:"+companyInfo);
	    // 然后进行自己的处理, 想做什么都可以.
	}
}
