package com.go.sys.common.model;

import org.apache.commons.lang3.StringUtils;

/**
 * 数据字典类型
 * @author zhangjf
 * @create_time 2014-8-25 下午9:48:51
 */
public class Go_Common_Type {
	
	/**状态:正常*/
	public static final String STATUS_NORMAL="正常";
	/**状态:作废*/
	public static final String STATUS_DEL="作废";
	
	//主键id
	private Integer id;
	//类型名称
	private String name;
	//类型排序标识
	private String seq;
	//类型描述
	private String description;
	//状态
	private String status;
	//类型标识
	private String extension;
	
	/**
	 * 数据完整性校验
	 * @author zhangjf
	 * @create_time 2014-8-25 下午10:01:48
	 * @return
	 */
	public String validate(){
		if(StringUtils.isBlank(name)){
			return "数据字典类型名称不能为空";
		}
		if(StringUtils.isBlank(extension)){
			return "数据字典类型标识不能为空";
		}
		return "";
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
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	
	
}
