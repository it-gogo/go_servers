package com.go.sys.common.dao;

import java.util.List;
import java.util.Map;

import com.go.base.dao.IGo_BaseDao;
import com.go.sys.common.model.Go_Common_Data;

/**
 * 字典数据数据层接口
 * @author zhangjf
 * @create_time 2014-8-25 下午10:14:17
 */
public interface IGo_Common_DataDao extends
		IGo_BaseDao<Go_Common_Data, Integer> {

	/**
	 * 根据数据字典类型表达式获取数据
	 * @author zhangjf
	 * @create_time 2014-9-2 下午10:22:59
	 * @param params
	 * @return
	 */
	public List<Go_Common_Data> getDataByExtension(Map<String,Object> params);
}
