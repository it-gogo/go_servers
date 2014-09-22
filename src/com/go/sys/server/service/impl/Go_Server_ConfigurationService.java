package com.go.sys.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.server.dao.impl.Go_Server_ConfigurationDao;
import com.go.sys.server.model.Go_Server_Configuration;
import com.go.sys.server.service.IGo_Server_ConfigurationService;

/**
 * 服务器跟可配置关联表数据逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Server_ConfigurationService extends
		Go_BaseService<Go_Server_Configuration, Integer> implements IGo_Server_ConfigurationService {

	@Autowired
	public Go_Server_ConfigurationService(Go_Server_ConfigurationDao dao) {
		super(dao);
	}

}
