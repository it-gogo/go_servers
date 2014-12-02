package com.go.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.go.sys.common.model.Go_Advertising;
import com.go.sys.common.service.IGo_AdvertisingService;

public class Company  implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		WebApplicationContext rwp = WebApplicationContextUtils.getRequiredWebApplicationContext(arg0.getServletContext());
		IGo_AdvertisingService go_advertisingService= (IGo_AdvertisingService)rwp.getBean("Go_AdvertisingService");
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("isactives", "1");
		List<Go_Advertising> list=go_advertisingService.list(params);
		if(list!=null && list.size()>0){
			arg0.getServletContext().setAttribute("advertising", list.get(0));
		}
//		System.out.println("companyInfo:"+companyInfo);
	    // 然后进行自己的处理, 想做什么都可以.
	}
}
