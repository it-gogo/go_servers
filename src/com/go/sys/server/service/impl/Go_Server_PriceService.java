package com.go.sys.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.server.dao.impl.Go_Server_PriceDao;
import com.go.sys.server.model.Go_Server_Price;
import com.go.sys.server.service.IGo_Server_PriceService;

/**
 * 价格相关信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Server_PriceService extends
		Go_BaseService<Go_Server_Price, Integer> implements IGo_Server_PriceService {

	@Autowired
	public Go_Server_PriceService(Go_Server_PriceDao dao) {
		super(dao);
	}

}
