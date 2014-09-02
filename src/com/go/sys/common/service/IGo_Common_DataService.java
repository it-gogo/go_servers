package com.go.sys.common.service;

import java.util.List;
import java.util.Map;

import com.go.base.service.IGo_BaseService;
import com.go.sys.common.model.Go_Common_Data;

/**
 * 数据字典数据逻辑层接口
 * @author zhangjf
 * @create_time 2014-8-27 下午10:52:26
 */
public interface IGo_Common_DataService extends IGo_BaseService<Go_Common_Data, Integer> {

	/**
	 * 根据数据字典类型表达式获取数据
	 * @author zhangjf
	 * @create_time 2014-9-2 下午10:22:59
	 * @param params
	 * @return
	 */
	public List<Go_Common_Data> getDataByExtension(Map<String,Object> params);
}
