package com.go.sys.authority.module;
/**
 * 后台权限实体类
 * @author linyb
 * @create_time 2014-8-21下午9:46:23
 */
public class Go_Sys_Power {
	
	private Integer id;			//id
	private String name;		//名字
	private Integer parent_id;	//父权限
	private String url;			//路径
	private Integer ordering;	//排序
	private String create_time;	//创建时间
	
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
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getOrdering() {
		return ordering;
	}
	public void setOrdering(Integer ordering) {
		this.ordering = ordering;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	
}
