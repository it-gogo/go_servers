package com.go.client.login.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

/**
 * ticket实体类
 * @author chenhb
 */
@Alias("Go_Ticket")
public class Go_Ticket {
	private Integer id ;		//id主键
	private Integer creator;	//创建人ID（可以为空）
	private String createdate;//创建时间
	private String name;		//姓名
	private String email;	//邮件地址
	private String title;	//标题
	private String urgenttype;	//紧急类型
	private String content;	//内容
	private String attachaddress;	//附件地址
	private String isdispose;	//是否处理
	private String ip;//ip地址
	
	private List<Go_Reply> list;//回复集合
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCreator() {
		return creator;
	}
	public void setCreator(Integer creator) {
		this.creator = creator;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrgenttype() {
		return urgenttype;
	}
	public void setUrgenttype(String urgenttype) {
		this.urgenttype = urgenttype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttachaddress() {
		return attachaddress;
	}
	public void setAttachaddress(String attachaddress) {
		this.attachaddress = attachaddress;
	}
	public String getIsdispose() {
		return isdispose;
	}
	public void setIsdispose(String isdispose) {
		this.isdispose = isdispose;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public List<Go_Reply> getList() {
		return list;
	}
	public void setList(List<Go_Reply> list) {
		this.list = list;
	}
	
}
