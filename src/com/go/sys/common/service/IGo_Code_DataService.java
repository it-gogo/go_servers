package com.go.sys.common.service;

import net.sf.json.JSONArray;

import com.go.base.service.IGo_BaseService;
import com.go.sys.common.model.Go_Code_Data;

/**
 * 数据字典数据逻辑层接口
 * @author chenhb
 */
public interface IGo_Code_DataService extends IGo_BaseService<Go_Code_Data, Integer> {

	public  JSONArray  getCodeTree();
	
	public  JSONArray  getCodeTreeByType(Integer type);
}
