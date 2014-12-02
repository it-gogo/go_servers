package com.go.sys.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.common.dao.impl.Go_AdvertisingDao;
import com.go.sys.common.model.Go_Advertising;
import com.go.sys.common.service.IGo_AdvertisingService;
/**
 * 数据字典数据逻辑层实现类
 * @author chenhb
 */
@Service("Go_AdvertisingService")
public class Go_AdvertisingService extends Go_BaseService<Go_Advertising, Integer> implements IGo_AdvertisingService {

	@Autowired
	public Go_AdvertisingService(Go_AdvertisingDao dao) {
		super(dao);
	}

}
