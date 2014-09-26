package com.go.client.cart.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.cart.dao.IGo_Order_InfoDao;
import com.go.client.cart.mapper.IGo_Order_InfoMapper;
import com.go.client.cart.model.Go_Order_Info;
/**
 * 订单信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Order_InfoDao extends Go_BaseDao<Go_Order_Info, Integer>
		implements IGo_Order_InfoDao {

	@Autowired
	public Go_Order_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Order_InfoMapper.class);
	}

	
}
