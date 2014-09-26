package com.go.client.cart.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.cart.dao.IGo_Order_DetailDao;
import com.go.client.cart.mapper.IGo_Order_DetailMapper;
import com.go.client.cart.model.Go_Order_Detail;
/**
 * 订单详单信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Order_DetailDao extends Go_BaseDao<Go_Order_Detail, Integer>
		implements IGo_Order_DetailDao {

	@Autowired
	public Go_Order_DetailDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Order_DetailMapper.class);
	}

	
}
