package com.go.client.cart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.go.base.service.impl.Go_BaseService;
import com.go.client.cart.dao.impl.Go_Product_ListDao;
import com.go.client.cart.model.Go_Product_List;
import com.go.client.cart.service.IGo_Product_ListService;

/**
 * 商品列表信息逻辑层实现类
 * @author chenhb
 */
@Service
public class Go_Product_ListService extends
		Go_BaseService<Go_Product_List, Integer> implements IGo_Product_ListService {

	@Autowired
	public Go_Product_ListService(Go_Product_ListDao dao) {
		super(dao);
	}

}
