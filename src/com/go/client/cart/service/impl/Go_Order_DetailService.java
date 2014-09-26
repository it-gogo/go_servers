package com.go.client.cart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.cart.dao.impl.Go_Order_DetailDao;
import com.go.client.cart.model.Go_Order_Detail;
import com.go.client.cart.service.IGo_Order_DetailService;

/**
 * 订单详单信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Order_DetailService extends
		Go_BaseService<Go_Order_Detail, Integer> implements IGo_Order_DetailService {

	@Autowired
	public Go_Order_DetailService(Go_Order_DetailDao dao) {
		super(dao);
	}

}
