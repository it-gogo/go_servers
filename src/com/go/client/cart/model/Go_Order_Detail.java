package com.go.client.cart.model;

import org.apache.ibatis.type.Alias;

/**
 * 订单详单信息
 * @author chenbh
 */
@Alias("Go_Order_Detail")
public class Go_Order_Detail {
	private Integer id ;		//id主键
	private Integer orderid;		//订单ID
	private Integer server;		//服务器ID
	private Integer priceid;//价格ID
	private String servername;	//服务器名称
	private String servertype;//服务器类型
	private String cpu;//CPU
	private String memory;//内存
	private String disk;//硬盘
	private String flow;//流量
	private String ipNum;//IP数量
	private String hostname;//主机名
	private String ns1prefix;//NS1 前缀
	private String ns2prefix;//NS2 前缀
	private String rootpw;//root密码
	private String configuration;//可配置项
	private String price;//价格
	private String time;//使用时间
	private String quarter;//季度
	private String maturity;//到期时间
	private String createdate;//创建时间
	private String result;//结果
	private String isfinish;//完成
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getMaturity() {
		return maturity;
	}
	public void setMaturity(String maturity) {
		this.maturity = maturity;
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public Integer getServer() {
		return server;
	}
	public void setServer(Integer server) {
		this.server = server;
	}
	public String getServername() {
		return servername;
	}
	public void setServername(String servername) {
		this.servername = servername;
	}
	public String getServertype() {
		return servertype;
	}
	public void setServertype(String servertype) {
		this.servertype = servertype;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
	}
	public String getFlow() {
		return flow;
	}
	public void setFlow(String flow) {
		this.flow = flow;
	}
	public String getIpNum() {
		return ipNum;
	}
	public void setIpNum(String ipNum) {
		this.ipNum = ipNum;
	}
	public String getConfiguration() {
		return configuration;
	}
	public void setConfiguration(String configuration) {
		this.configuration = configuration;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
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
	public Integer getPriceid() {
		return priceid;
	}
	public void setPriceid(Integer priceid) {
		this.priceid = priceid;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getIsfinish() {
		return isfinish;
	}
	public void setIsfinish(String isfinish) {
		this.isfinish = isfinish;
	}
}
