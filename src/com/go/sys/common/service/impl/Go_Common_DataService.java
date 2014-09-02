package com.go.sys.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.common.dao.IGo_Common_DataDao;
import com.go.sys.common.dao.impl.Go_Common_DataDao;
import com.go.sys.common.model.Go_Common_Data;
import com.go.sys.common.service.IGo_Common_DataService;
/**
 * 数据字典数据逻辑层实现类
 * @author zhangjf
 * @create_time 2014-8-27 下午10:53:48
 */
@Service
public class Go_Common_DataService extends Go_BaseService<Go_Common_Data, Integer> implements IGo_Common_DataService {

	@Autowired
	private IGo_Common_DataDao go_common_dataDao;
	@Autowired
	public Go_Common_DataService(Go_Common_DataDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 根据数据字典类型表达式获取数据
	 */
	@Override
	public List<Go_Common_Data> getDataByExtension(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return go_common_dataDao.getDataByExtension(params);
	}

}
