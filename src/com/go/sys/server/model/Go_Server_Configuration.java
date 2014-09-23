package com.go.sys.server.model;

import org.apache.ibatis.type.Alias;

/**
 * 服务器跟配置的关联表
 * @author chenbh
 */
@Alias("Go_Server_Configuration")
public class Go_Server_Configuration {
	private Integer id ;		//id主键
	private Integer server;		//服务器ID
	private Integer configuration;	//配置项
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
	public Integer getConfiguration() {
		return configuration;
	}
	public void setConfiguration(Integer configuration) {
		this.configuration = configuration;
	}
}
