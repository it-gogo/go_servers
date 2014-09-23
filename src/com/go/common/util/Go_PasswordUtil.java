package com.go.common.util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

/**
 *  (项目基本框架类)
 * 密码加密算法
 * @author it-gogo 
 */
public class Go_PasswordUtil {
	public static void main(String[] args) {

		System.out.println(Go_PasswordUtil.encrypt("1"));
	}

	/**
	 * 加密方法
	 * @author linjian 
	 * @create_date 2013-5-25 下午1:50:35
	 * @param password
	 * @return 加密后的字符串
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
	
	/**
	 * 验证密码是否有效
	 * @author linhui
	 * @create_date 2013-9-16 上午10:32:25
	 * @param password
	 * @return
	 */
	public static boolean checkPassword(String password){
        String pwd = "^(?![^a-zA-Z]+$)(?!\\D+$).{6,}$";
        Pattern p = Pattern.compile(pwd);
        Matcher m = p.matcher(password);
        return m.matches();
	}
}
