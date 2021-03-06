package com.go.client.alipay;

import java.io.UnsupportedEncodingException;
import java.security.SignatureException;

import org.apache.commons.codec.digest.DigestUtils;

/** 
* 功能：支付宝MD5签名处理核心文件，不需要修改
* 版本：3.3
* 修改日期：2012-08-17
* 说明：
* 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
* 该代码仅供学习和研究支付宝接口使用，只是提供一个
* */

public class MD5 {

    /**
     * 签名字符串
     * @param text 需要签名的字符串
     * @param key 密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static String sign(String text, String key, String input_charset) {
    	text = text + key;
    	System.out.println("text:"+text);
    	System.out.println("Hex:"+DigestUtils.md5Hex(getContentBytes(text, input_charset)));
        return DigestUtils.md5Hex(getContentBytes(text, input_charset));
    }
    
    public static void main(String[] args) {
		String text="_input_charset=utf-8&body=智易推33,金额:0.1&defaultbank=ICBC-DEBIT&exter_invoke_ip=172.241.157.249&out_trade_no=33&partner=2088901462175412&payment_type=1&paymethod=bankPay&return_url=http://www.zhiyitui.com/go_servers/client/cart/order/alipayReturn.htm?id=33&seller_email=zhiyitui@163.com&service=create_direct_pay_by_user&subject=智易推33&total_fee=0.1null";
		System.out.println(DigestUtils.md5Hex(getContentBytes(text, "UTF-8")));
	}
//_input_charset=utf-8&body=智易推33,金额:0.1&defaultbank=ICBC-DEBIT&exter_invoke_ip=172.241.157.249&out_trade_no=33&partner=2088901462175412&payment_type=1&paymethod=bankPay&return_url=http://www.zhiyitui.com/go_servers/client/cart/order/alipayReturn.htm?id=33&seller_email=zhiyitui@163.com&service=create_direct_pay_by_user&subject=智易推33&total_fee=0.1null
//_input_charset=utf-8&body=智易推33,金额:0.1&defaultbank=ICBC-DEBIT&exter_invoke_ip=172.241.157.249&out_trade_no=33&partner=2088901462175412&payment_type=1&paymethod=bankPay&return_url=http://www.zhiyitui.com/go_servers/client/cart/order/alipayReturn.htm?id=33&seller_email=zhiyitui@163.com&service=create_direct_pay_by_user&subject=智易推33&total_fee=0.1lz75ralbenzme3frltkf2dzbx1wnzmgx
    /**
     * 签名字符串
     * @param text 需要签名的字符串
     * @param sign 签名结果
     * @param key 密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static boolean verify(String text, String sign, String key, String input_charset) {
    	text = text + key;
    	String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
    	if(mysign.equals(sign)) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }

    /**
     * @param content
     * @param charset
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException 
     */
    private static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }

}