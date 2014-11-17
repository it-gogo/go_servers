package com.go.sys.server.service;

import net.sf.json.JSONArray;

import com.go.base.service.IGo_BaseService;
import com.go.sys.server.model.Go_Server_Type;

/**
 * 服务器类型逻辑层接口
 * @author chenhb
 */
public interface IGo_Server_TypeService extends
		IGo_BaseService<Go_Server_Type, Integer> {

	public JSONArray getTypeTree();
	public JSONArray findServerTypeTree();
}
