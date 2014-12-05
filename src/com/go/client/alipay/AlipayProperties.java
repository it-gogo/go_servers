package com.go.client.alipay;

import java.io.InputStream;
import java.util.Properties;

public class AlipayProperties {
	private static Properties p;
	static{
		try{
			InputStream stream = AlipayProperties.class.getClassLoader().getResourceAsStream("config/alipay.properties");
			p = new Properties();
		    p.load(stream);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static String getValue(String key){
		String value=p.getProperty(key);
		 return value;
	}
	
	public static void main(String[] args) {
		System.out.println(getValue("key"));
	}
}
