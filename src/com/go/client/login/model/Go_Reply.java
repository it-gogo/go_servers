package com.go.client.login.model;

import org.apache.ibatis.type.Alias;

/**
 * 回复ticket实体类
 * @author chenhb
 */
@Alias("Go_Reply")
public class Go_Reply {
	private Integer id ;		//id主键
	private Integer ticketid;//ticketid
	private Integer creator;	//创建人ID（可以为空）
	private String createdate;//创建时间
	private String replyname;		//回复人姓名
	private String replyemail;	//回复邮件地址
	private String replycontent;	//回复内容
	private String attachaddress;	//附件地址
	private String ip;//ip地址
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
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getReplyname() {
		return replyname;
	}
	public void setReplyname(String replyname) {
		this.replyname = replyname;
	}
	public String getReplyemail() {
		return replyemail;
	}
	public void setReplyemail(String replyemail) {
		this.replyemail = replyemail;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getAttachaddress() {
		return attachaddress;
	}
	public void setAttachaddress(String attachaddress) {
		this.attachaddress = attachaddress;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Integer getTicketid() {
		return ticketid;
	}
	public void setTicketid(Integer ticketid) {
		this.ticketid = ticketid;
	}
}
