package com.go.sys.common.model;

import org.apache.ibatis.type.Alias;

/**
 * 数据字典实体
 * @author chenhb
 */
@Alias("Go_Code_Data")
public class Go_Code_Data {
	
	//主键
	private Integer id;
	//数据名称
	private String name;
	//类型
	private Integer type;
	//类型名称
	private String typename;
	//排序
	private Integer seq;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
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
}
