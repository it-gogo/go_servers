package com.go.sys.authority.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.dao.impl.Go_UserDao;
import com.go.sys.authority.model.Go_User;
import com.go.sys.authority.service.IGo_UserService;

/**
 * 后台用户管理 逻辑层实现类
 * @author linyb
 * @create_time 2014-8-25下午9:34:11
 */
@Service
public class Go_UserService extends Go_BaseService<Go_User, Integer> implements IGo_UserService{

	@Autowired
	public Go_UserService(Go_UserDao dao) {
		super(dao);
	}

}
