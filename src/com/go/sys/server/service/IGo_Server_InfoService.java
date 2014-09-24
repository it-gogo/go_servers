package com.go.sys.server.service;

import net.sf.json.JSONArray;

import com.go.base.service.IGo_BaseService;
import com.go.sys.server.model.Go_Server_Info;

/**
 * 套餐服务相关信息逻辑层接口
 * @author zhangjf
 * @create_time 2014-9-1 下午11:05:18
 */
public interface IGo_Server_InfoService extends
		IGo_BaseService<Go_Server_Info, Integer> {

	/**
	 * 
	 * @return
	 */
	public  JSONArray  findConfigurationTree();
	/**
	 * 服务器类型树
	 * @return
	 */
	public  JSONArray  findServerTypeTree();
}
