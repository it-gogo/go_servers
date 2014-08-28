package com.go.sys.common.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;

/**
 * 字典数据实体
 * @author zhangjf
 * @create_time 2014-8-25 下午9:26:25
 */
@Alias("Go_Common_Data")
public class Go_Common_Data {
	/**状态:正常*/
	public static final String STATUS_NORMAL="正常";
	/**状态:作废*/
	public static final String STATUS_DEL="作废";
	
	//主键
	private Integer id;
	//数据名称
	private String data_name;
	//数据状态
	private String status;
	//数据排序标识
	private String order;
	//对应的数据字典类型ID
	private Integer type_id;
	//对应数据字典类型名称
	private String type_name;
	//创建时间
	private String create_time;
	//修改时间
	private String update_time;
	//备注
	private String remark;
	
	/**
	 * 数据完整性校验
	 * @author zhangjf
	 * @create_time 2014-8-25 下午9:41:50
	 * @return
	 */
	public String validate(){
		if(StringUtils.isBlank(type_name)){
			return "数据字典类型名称不能为空";
		}
		if(type_id==null){
			return "数据字典类型ID不能为空";
		}
		return "";
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getData_name() {
		return data_name;
	}
	public void setData_name(String data_name) {
		this.data_name = data_name;
	}
	
	
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
