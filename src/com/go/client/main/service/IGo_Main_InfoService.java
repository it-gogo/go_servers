package com.go.client.main.service;

import java.util.List;
import java.util.Map;

import com.go.base.service.IGo_BaseService;
import com.go.sys.authority.model.Go_Department_Info;
/**
 * 服务器列表信息 逻辑层接口
 * @author chenhb
 *
 */
public interface IGo_Main_InfoService  extends IGo_BaseService<Go_Department_Info, Integer> {
	/**
	 * 通过类型获得list
	 * @param type
	 * @return
	 */
	public List<Map<String,Object>> getMapByType(String type);
}
