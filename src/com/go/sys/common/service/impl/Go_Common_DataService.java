package com.go.sys.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
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
	public Go_Common_DataService(Go_Common_DataDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
