package com.go.client.cart.model;

import net.sf.json.JSONObject;

import org.apache.ibatis.type.Alias;

/**
 * 购物车基本信息
 * @author chenbh
 */
@Alias("Go_Product_List")
public class Go_Product_List {
	private Integer id ;		//id主键
	private Integer cart;		//购物车ID
	private Integer server;//服务器ID
	private Integer price;	//价格ID
	private String type;//服务器类型
	private String servername;//服务器名称
	private String hostname;//主机名
	private String ns1prefix;//NS1 前缀
	private String ns2prefix;//NS2 前缀
	private String rootpw;//root密码
	private String configuration;//可配置项
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCart() {
		return cart;
	}
	public void setCart(Integer cart) {
		this.cart = cart;
	}
	public Integer getServer() {
		return server;
	}
	public void setServer(Integer server) {
		this.server = server;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getNs1prefix() {
		return ns1prefix;
	}
	public void setNs1prefix(String ns1prefix) {
		this.ns1prefix = ns1prefix;
	}
	public String getNs2prefix() {
		return ns2prefix;
	}
	public void setNs2prefix(String ns2prefix) {
		this.ns2prefix = ns2prefix;
	}
	public String getRootpw() {
		return rootpw;
	}
	public void setRootpw(String rootpw) {
		this.rootpw = rootpw;
	}
	public String getConfiguration() {
		return configuration;
	}
	public void setConfiguration(String configuration) {
		this.configuration = configuration;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String toString(){
		return JSONObject.fromObject(this).toString();
	}
	public String getServername() {
		return servername;
	}
	public void setServername(String servername) {
		this.servername = servername;
	}
}
