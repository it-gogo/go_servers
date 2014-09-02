package com.go.sys.server.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.go.base.service.impl.Go_BaseService;
import com.go.sys.server.dao.impl.Go_Server_InfoDao;
import com.go.sys.server.model.Go_Server_Info;
import com.go.sys.server.service.IGo_Server_InfoService;

/**
 * 服务相关信息逻辑层实现类
 * @author zhangjf
 * @create_time 2014-9-1 下午11:06:46
 */
@Service
public class Go_Server_InfoService extends
		Go_BaseService<Go_Server_Info, Integer> implements IGo_Server_InfoService {

	@Autowired
	public Go_Server_InfoService(Go_Server_InfoDao dao) {
		super(dao);
	}

}
