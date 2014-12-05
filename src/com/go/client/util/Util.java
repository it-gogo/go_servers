package com.go.client.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;



public class Util {
	public static void main(String[] args) throws UnsupportedEncodingException {
		String str="https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice+%E5%8F%91%E7%A5%A8%233308&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=3308&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=112.16&sign=5f8a1964aa29618a4f2e2ed71db07853&sign_type=MD5";
		System.out.println(new String(str.getBytes("ISO-8859-1"),"UTF-8"));
		System.out.println(URLDecoder.decode(str,"UTF-8"));
	}
}
//https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice%E5%8F%91%E7%A5%A8%233308&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=3308&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=112.16&sign=5f8a1964aa29618a4f2e2ed71db07853&sign_type=MD5
//https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice%E5%8F%91%E7%A5%A8%233308&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=3308&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=112.16&sign=5f8a1964aa29618a4f2e2ed71db07853&sign_type=MD5
//https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice+%E5%8F%91%E7%A5%A8%233308&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=3308&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=112.16&sign=5f8a1964aa29618a4f2e2ed71db07853&sign_type=MD5
//https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice+%E5%8F%91%E7%A5%A8%233308&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=3308&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=112.16&sign=5f8a1964aa29618a4f2e2ed71db07853&sign_type=MD5