package com.go.sys.section.model;

import net.sf.json.JSONObject;

import org.apache.ibatis.type.Alias;

/**
 * 公司基本信息
 * @author chenbh
 */
@Alias("Go_Company_Info")
public class Go_Company_Info {
	private Integer id ;		//id主键
	private String history;		//公司历史
	private String corecompetitiveness;	//核心竞争力
	private String briefintroduction;	//公司简介
	private String telephone;	//电话
	private String qq;	//qq
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getCorecompetitiveness() {
		return corecompetitiveness;
	}
	public void setCorecompetitiveness(String corecompetitiveness) {
		this.corecompetitiveness = corecompetitiveness;
	}
	public String getBriefintroduction() {
		return briefintroduction;
	}
	public void setBriefintroduction(String briefintroduction) {
		this.briefintroduction = briefintroduction;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String toString(){
		return JSONObject.fromObject(this).toString();
	}
}
