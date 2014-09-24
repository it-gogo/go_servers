package com.go.client.cart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.cart.dao.impl.Go_Cart_InfoDao;
import com.go.client.cart.model.Go_Cart_Info;
import com.go.client.cart.service.IGo_Cart_InfoService;

/**
 * 购物车信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Cart_InfoService extends
		Go_BaseService<Go_Cart_Info, Integer> implements IGo_Cart_InfoService {

	@Autowired
	public Go_Cart_InfoService(Go_Cart_InfoDao dao) {
		super(dao);
	}

}
