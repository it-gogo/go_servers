package com.go.sys.authority.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.sys.authority.dao.impl.Go_Department_InfoDao;
import com.go.sys.authority.module.Go_Department_Info;
import com.go.sys.authority.service.IGo_Department_InfoService;

/**
 * 用户部门信息 逻辑层实现类
 * @author linyb
 * @create_date 2014-8-25下午5:26:06
 */
@Service
public class Go_Department_InfoService extends Go_BaseService<Go_Department_Info, Integer> implements IGo_Department_InfoService{

	@Autowired
	public Go_Department_InfoService(Go_Department_InfoDao dao) {
		super(dao);
	}

}
