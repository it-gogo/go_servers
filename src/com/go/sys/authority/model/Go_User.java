package com.go.sys.authority.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;

/**
 * 后台用户实体类
 * @author linyb
 * @create_time 2014-8-25下午9:17:11
 */
@Alias("Go_User")
public class Go_User {
	/**用户状态--正常*/
	public static String USER_STATUS_OK = "正常";
	/**用户状态--禁用*/
	public static String USER_STATUS_UNOK ="禁用";
	
	
	private Integer id;		//id;
	private String name;	//名字
	private String username;	//账号
	private String telephone;//电话
	private String password; //密码
	private String status;		//状态
	private Integer departmentId; //部门id

	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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

	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentid(Integer departmentId) {
		this.departmentId = departmentId;
	}
	/**
	 * 验证信息
	 * @author linyb
	 * @create_time 2014-8-31上午9:46:19
	 */
	public String validate() {
		if(StringUtils.isBlank(username)){
			return "用户名不能为空！";
		}
		if(StringUtils.isBlank(password)){
			return "密码不能为空！";
		}
		return "200";
	}
	
}
