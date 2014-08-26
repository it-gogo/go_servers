package com.go.client.serverList.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.serverList.dao.impl.Go_ServerList_InfoDao;
import com.go.client.serverList.service.IGo_ServerList_InfoService;
import com.go.sys.authority.model.Go_Department_Info;

/**
 * 服务器列表信息 逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_ServerList_InfoService extends Go_BaseService<Go_Department_Info, Integer> implements IGo_ServerList_InfoService{

	@Autowired
	public Go_ServerList_InfoService(Go_ServerList_InfoDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	

	

}
