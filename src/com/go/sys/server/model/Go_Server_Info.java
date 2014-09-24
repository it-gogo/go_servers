package com.go.sys.server.model;

import java.util.List;

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
	private Integer areaId;
	//服务器类型ID
	private Integer serverTypeId;
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
	private String netFast;
	//IP地址数
	private String ipNum;
	//端口
	private String port;
	//操作系统ID
	private Integer	operationSystemId;
	//控制面板ID
	private Integer controlPanelId;
	//图片地址
	private String imgUrl;
	//描述
	private String description;
	//状态
	private String isactives;
	
	private List<Go_Server_Price> pricelist;
	
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
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
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

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public Integer getServerTypeId() {
		return serverTypeId;
	}

	public void setServerTypeId(Integer serverTypeId) {
		this.serverTypeId = serverTypeId;
	}

	public String getNetFast() {
		return netFast;
	}

	public void setNetFast(String netFast) {
		this.netFast = netFast;
	}

	public String getIpNum() {
		return ipNum;
	}

	public void setIpNum(String ipNum) {
		this.ipNum = ipNum;
	}

	public Integer getOperationSystemId() {
		return operationSystemId;
	}

	public void setOperationSystemId(Integer operationSystemId) {
		this.operationSystemId = operationSystemId;
	}

	public Integer getControlPanelId() {
		return controlPanelId;
	}

	public void setControlPanelId(Integer controlPanelId) {
		this.controlPanelId = controlPanelId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public List<Go_Server_Price> getPricelist() {
		return pricelist;
	}

	public void setPricelist(List<Go_Server_Price> pricelist) {
		this.pricelist = pricelist;
	}
}
