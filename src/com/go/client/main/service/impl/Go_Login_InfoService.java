package com.go.client.main.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.main.dao.impl.Go_Login_InfoDao;
import com.go.client.main.service.IGo_Login_InfoService;
import com.go.sys.authority.model.Go_Department_Info;

/**
 * 用户登陆信息 逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Login_InfoService extends Go_BaseService<Go_Department_Info, Integer> implements IGo_Login_InfoService{

	@Autowired
	public Go_Login_InfoService(Go_Login_InfoDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	

	

}
