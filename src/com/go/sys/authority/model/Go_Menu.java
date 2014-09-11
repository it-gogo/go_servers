package com.go.sys.authority.model;

import org.apache.ibatis.type.Alias;

/**
 * 菜单信息
 * @author chenhb
 *
 */
@Alias("Go_Menu")
public class Go_Menu {

	// Fields

	private Integer id;//主键
	private String number;//编码
	private String name;//名称
	private String parentnumber;//父编码
	private String urls;//路径
	private Integer seq;//排序
	private Integer step;//阶级
	private Integer parentid;//父ID
	private String imgurl;//图片路径
	private Integer isactives;//是否使用
	private String description;//描述
	public Integer getId() {
		return id;
	}
	public Integer getStep() {
		return step;
	}
	public void setStep(Integer step) {
		this.step = step;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentnumber() {
		return parentnumber;
	}
	public void setParentnumber(String parentnumber) {
		this.parentnumber = parentnumber;
	}
	public String getUrls() {
		return urls;
	}
	public void setUrls(String urls) {
		this.urls = urls;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public Integer getIsactives() {
		return isactives;
	}
	public void setIsactives(Integer isactives) {
		this.isactives = isactives;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}