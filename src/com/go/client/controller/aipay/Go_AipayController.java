package com.go.client.controller.aipay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.Go_BaseController;

@Controller
@RequestMapping(value="/client/pay_result/*")
public class Go_AipayController extends Go_BaseController{
	
	@RequestMapping(value="testResult.htm")
	public String result(){
		System.out.println("Result。。。");
		return null;
	}
}
