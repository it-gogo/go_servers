package com.go.sys.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.server.dao.impl.Go_Server_Configuration_TypeDao;
import com.go.sys.server.model.Go_Server_Configuration_Type;
import com.go.sys.server.service.IGo_Server_Configuration_TypeService;

/**
 * 服务器跟可配置关联表数据逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Server_Configuration_TypeService extends
		Go_BaseService<Go_Server_Configuration_Type, Integer> implements IGo_Server_Configuration_TypeService {

	@Autowired
	public Go_Server_Configuration_TypeService(Go_Server_Configuration_TypeDao dao) {
		super(dao);
	}

}
