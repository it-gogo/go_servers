package com.go.sys.server.model;

import org.apache.ibatis.type.Alias;

/**
 * 可配置数据
 * @author chenbh
 */
@Alias("Go_Configuration_Data")
public class Go_Configuration_Data {
	private Integer id ;		//id主键
	private Integer type;		//类型
	private String name;	//名称
	private Integer seq;	//排序
	private String price;	//价格
	private String typename;	//类型名称
	private String description;	//描述
	private String isactives;	//是否使用
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
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
