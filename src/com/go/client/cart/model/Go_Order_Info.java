package com.go.client.cart.model;

import org.apache.ibatis.type.Alias;

/**
 * 订单基本信息
 * @author chenbh
 */
@Alias("Go_Order_Info")
public class Go_Order_Info {
	private Integer id ;		//id主键
	private Integer portal;		//门户ID
	private String ordername;	//订单人名称
	private String ordertelephone;//订单人电话
	private String payment;//支付方式
	private String status;//状态
	private String createdate;//创建时间
	private String totalprice;//总价
	private String notes;//注意事项
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
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getOrdertelephone() {
		return ordertelephone;
	}
	public void setOrdertelephone(String ordertelephone) {
		this.ordertelephone = ordertelephone;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
}
