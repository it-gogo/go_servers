package com.go.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import org.apache.commons.lang3.StringUtils;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

/**
 * 字符串工具类
 * @author zhangjf
 * @create_date 2014-8-20 下午08:41:32
 */
public class Go_StringUtil {
	
	/**
	 * 根据格式四舍五入
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:42:04
	 * @param num
	 * @param format
	 * @return 结果
	 */
	public static String format(String num,String format){
		if(StringUtils.isBlank(num))return "0";
		java.text.DecimalFormat df = new java.text.DecimalFormat(format);
		return df.format(Double.parseDouble(num));
	}
	
	/**
	 * 根据金额加密
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:42:18
	 * @param balance
	 * @return
	 */
	public static String serByBalance(String balance){
		return encrypt(balance);
	}
	
	/**
	 * 字符串数字相加
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:42:35
	 * @param num1
	 * @param num2
	 * @param format
	 * @return
	 */
	public static String sum(String num1,String num2,String format){
		if(StringUtils.isBlank(num1))num1 = "0";
		if(StringUtils.isBlank(num2))num2 = "0";
		DecimalFormat df = new DecimalFormat(format);
		Double d1 = new Double(num1);
		Double d2 = new Double(num2);
		return df.format(d1 + d2).toString();
	}
	
	/**
	 * 字符串数字相减
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:42:46
	 * @param num1
	 * @param num2
	 * @param format
	 * @return
	 */
	public static String subtraction(String num1,String num2,String format){
		if(StringUtils.isBlank(num1))num1 = "0";
		if(StringUtils.isBlank(num2))num2 = "0";
		DecimalFormat df = new DecimalFormat(format);
		Double d1 = new Double(num1);
		Double d2 = new Double(num2);
		return df.format(d1 - d2).toString();
	}
	
	/**
	 * 字符串除法操作
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:43:06
	 * @param num1
	 * @param num2
	 * @param format
	 * @return
	 */
	public static String division(String num1,String num2,String format){
		if(StringUtils.isBlank(num1))num1 = "0";
		if(StringUtils.isBlank(num2))num2 = "0";
		DecimalFormat df = new DecimalFormat(format);
		Double d1 = new Double(num1);
		Double d2 = new Double(num2);
		return df.format(d1 / d2).toString();
	}
	
	/**
	 * 乘法
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:43:26
	 * @param num1
	 * @param num2
	 * @param format
	 * @return
	 */
	public static String multiplication(String num1,String num2,String format){
		if(StringUtils.isBlank(num1))num1 = "0";
		if(StringUtils.isBlank(num2))num2 = "0";
		DecimalFormat df = new DecimalFormat(format);
		Double d1 = new Double(num1);
		Double d2 = new Double(num2);
		return df.format(d1 * d2).toString();
	}
	
	/**
	 * 加密方法
	 * @author zhangjf
	 * @create_date 2014-8-20 下午08:43:34
	 * @param password
	 * @return 加密后字符串
	 */
	public static String encrypt(String password) {

		MessageDigest md;
		try {

			md = MessageDigest.getInstance("MD5");
			
			int size = password.length()/2;
			md.update((password+(size!=0?password.substring(size-1,size):"")).getBytes());

			return Base64.encode(md.digest());

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}

		return null;
	}
}
