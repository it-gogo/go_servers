package com.go.sys.server.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;

/**
 * 服务器价格
 * @author chenhb
 */
@Alias("Go_Server_Price")
public class Go_Server_Price {
	//主键ID
	private Integer id;
	//服务器ID
	private Integer serverId;
	//价格名称
	private String name;
	//每月价格
	private String monthlyPrice;
	//总共几个月
	private String numMonth;
	//季度
	private String quarter;
	//描述
	private String description;
	//是否使用
	private String isactives;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMonthlyPrice() {
		return monthlyPrice;
	}
	public void setMonthlyPrice(String monthlyPrice) {
		this.monthlyPrice = monthlyPrice;
	}
	public String getNumMonth() {
		return numMonth;
	}
	public void setNumMonth(String numMonth) {
		this.numMonth = numMonth;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsactives() {
		return isactives;
	}
	public void setIsactives(String isactives) {
		this.isactives = isactives;
	}
	public Integer getServerId() {
		return serverId;
	}
	public void setServerId(Integer serverId) {
		this.serverId = serverId;
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	
}
