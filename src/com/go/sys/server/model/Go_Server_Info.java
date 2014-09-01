package com.go.sys.server.model;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.Alias;

/**
 * 服务器套餐基本信息
 * @author zhangjf
 * @create_time 2014-9-1 下午10:05:09
 */
@Alias("Go_Server_Info")
public class Go_Server_Info {
	//主键ID
	private Integer id;
	//区域ID
	private Integer area_id;
	//服务器类型ID
	private Integer server_type_id;
	//套餐名称
	private String name;
	//套餐CPU信息
	private String cpu;
	//套餐内存信息
	private String memory;
	//套餐硬盘信息
	private String disk;
	//云端备份
	private String backups;
	//流量
	private String flow;
	//网速
	private String net_fast;
	//IP地址数
	private String ip_num;
	//端口
	private String port;
	//操作系统ID
	private Integer	operation_system_id;
	//控制面板ID
	private Integer control_panel_id;
	//图片地址
	private String img_url;
	//购买时长
	private String buy_times;
	//描述
	private String description;
	//状态
	private String status;
	
	/**
	 * 数据完整性校验
	 * @author zhangjf
	 * @create_time 2014-9-1 下午10:41:00
	 * @return
	 */
	public String validate(){
		if(StringUtils.isBlank(name)){
			return "套餐名称不能为空";
		}
		if(StringUtils.isBlank(cpu)){
			return "套餐CPU相关信息不能为空";
		}
		return "";
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getArea_id() {
		return area_id;
	}
	public void setArea_id(Integer area_id) {
		this.area_id = area_id;
	}
	public Integer getServer_type_id() {
		return server_type_id;
	}
	public void setServer_type_id(Integer server_type_id) {
		this.server_type_id = server_type_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
	}
	public String getBackups() {
		return backups;
	}
	public void setBackups(String backups) {
		this.backups = backups;
	}
	public String getFlow() {
		return flow;
	}
	public void setFlow(String flow) {
		this.flow = flow;
	}
	public String getNet_fast() {
		return net_fast;
	}
	public void setNet_fast(String net_fast) {
		this.net_fast = net_fast;
	}
	public String getIp_num() {
		return ip_num;
	}
	public void setIp_num(String ip_num) {
		this.ip_num = ip_num;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public Integer getOperation_system_id() {
		return operation_system_id;
	}
	public void setOperation_system_id(Integer operation_system_id) {
		this.operation_system_id = operation_system_id;
	}
	public Integer getControl_panel_id() {
		return control_panel_id;
	}
	public void setControl_panel_id(Integer control_panel_id) {
		this.control_panel_id = control_panel_id;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getBuy_times() {
		return buy_times;
	}
	public void setBuy_times(String buy_times) {
		this.buy_times = buy_times;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
