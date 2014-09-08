package com.go.sys.section.model;

import org.apache.ibatis.type.Alias;

/**
 * 公告基本信息
 * @author chenbh
 */
@Alias("Go_Notice")
public class Go_Notice {
	private Integer id ;		//id主键
	private String type;		//类型
	private Integer creator;	//创建人
	private String createdate;	//创建时间
	private String title;	//标题
	private String content;	//内容
	private String isactives;	//是否使用
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getCreator() {
		return creator;
	}
	public void setCreator(Integer creator) {
		this.creator = creator;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIsactives() {
		return isactives;
	}
	public void setIsactives(String isactives) {
		this.isactives = isactives;
	}
}
