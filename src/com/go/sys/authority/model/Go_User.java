package com.go.sys.authority.model;

import org.apache.ibatis.type.Alias;

/**
 * 后台用户实体类
 * @author linyb
 * @create_time 2014-8-25下午9:17:11
 */
@Alias("Go_User")
public class Go_User {
	
	private Integer id;		//id;
	private String name;	//名字
	private String username;	//账号
	private String telephone;//电话
	private String password; //密码
	
	private Integer parentId; //部门id

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

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
}
