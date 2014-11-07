package com.go.sys.server.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;

/**
 * 机房管理实体类
 * @author linyb
 * @create_time 2014-11-7下午7:24:54
 */
@Alias("Go_Server_Room")
public class Go_Server_Room {
	
	private Integer id;
	private String  name;
	private String  descript;
	private String  address; 
	
	public String validate(){
		if(StringUtils.isBlank(name)){
			return "机房的名字不能为空！";
		}
		return "200";
	}
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
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
