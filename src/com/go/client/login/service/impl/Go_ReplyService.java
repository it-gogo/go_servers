package com.go.client.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.login.dao.impl.Go_ReplyDao;
import com.go.client.login.model.Go_Reply;
import com.go.client.login.service.IGo_ReplyService;

/**
 * 回复ticket信息 逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_ReplyService extends Go_BaseService<Go_Reply, Integer> implements IGo_ReplyService{

	@Autowired
	public Go_ReplyService(Go_ReplyDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	

	

}
