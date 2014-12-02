package com.go.sys.common.model;

import org.apache.ibatis.type.Alias;

/**
 * 广告实体
 * @author chenhb
 */
@Alias("Go_Advertising")
public class Go_Advertising {
	
	//主键
	private Integer id;
	//名称
	private String name;
	//连接地址
	private String url;
	//图片地址
	private String imgUrl;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
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
