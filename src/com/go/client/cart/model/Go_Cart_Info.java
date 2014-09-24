package com.go.client.cart.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

/**
 * 购物车基本信息
 * @author chenbh
 */
@Alias("Go_Cart_Info")
public class Go_Cart_Info {
	private Integer id ;		//id主键
	private Integer portal;		//门户
	private String ip;//ip地址
	private String createdate;	//创建时间
	private List<Go_Product_List> productlist;//商品列表
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPortal() {
		return portal;
	}
	public void setPortal(Integer portal) {
		this.portal = portal;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public List<Go_Product_List> getProductlist() {
		return productlist;
	}
	public void setProductlist(List<Go_Product_List> productlist) {
		this.productlist = productlist;
	}
}
