package com.go.client.cart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.cart.dao.impl.Go_Order_InfoDao;
import com.go.client.cart.model.Go_Order_Info;
import com.go.client.cart.service.IGo_Order_InfoService;

/**
 * 订单信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Order_InfoService extends
		Go_BaseService<Go_Order_Info, Integer> implements IGo_Order_InfoService {

	@Autowired
	public Go_Order_InfoService(Go_Order_InfoDao dao) {
		super(dao);
	}

}
