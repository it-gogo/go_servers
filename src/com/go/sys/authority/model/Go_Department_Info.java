package com.go.sys.authority.model;

import org.apache.ibatis.type.Alias;

/**
 * 用户部门信息实体类
 * @author linyb
 * @create_date 2014-8-25下午5:02:37
 */
@Alias("Go_Department_Info")
public class Go_Department_Info {
	private Integer id ;		//id
	private Integer parentId;	//父节点id
	private String name;		//部门名
	private String telephone;	//部门电话
	private String description;	//描述
	private String isActives;	//是否活跃
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsActives() {
		return isActives;
	}
	public void setIsActives(String isActives) {
		this.isActives = isActives;
	}
}
