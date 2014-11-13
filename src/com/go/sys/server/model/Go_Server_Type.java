package com.go.sys.server.model;

import org.apache.ibatis.type.Alias;

/**
 * 服务器类型
 * @author chenhb
 */
@Alias("Go_Server_Type")
public class Go_Server_Type {
	
	//主键
	private Integer id;
	//编码
	private Integer code;
	//名称
	private String name;
	//父ID
	private Integer pid;
	//是否使用
	private String isactives;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getIsactives() {
		return isactives;
	}
	public void setIsactives(String isactives) {
		this.isactives = isactives;
	}
}
