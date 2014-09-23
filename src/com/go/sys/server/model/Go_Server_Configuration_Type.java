package com.go.sys.server.model;

import org.apache.ibatis.type.Alias;

/**
 * 服务器跟配置类型的关联表
 * @author chenbh
 */
@Alias("Go_Server_Configuration_Type")
public class Go_Server_Configuration_Type {
	private Integer id ;		//id主键
	private Integer server;		//服务器ID
	private Integer configurationType;	//配置项类型
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getServer() {
		return server;
	}
	public void setServer(Integer server) {
		this.server = server;
	}
	public Integer getConfigurationType() {
		return configurationType;
	}
	public void setConfigurationType(Integer configurationType) {
		this.configurationType = configurationType;
	}
}
