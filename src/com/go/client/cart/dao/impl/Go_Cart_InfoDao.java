package com.go.client.cart.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.cart.dao.IGo_Cart_InfoDao;
import com.go.client.cart.mapper.IGo_Cart_InfoMapper;
import com.go.client.cart.model.Go_Cart_Info;
/**
 * 购物车信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Cart_InfoDao extends Go_BaseDao<Go_Cart_Info, Integer>
		implements IGo_Cart_InfoDao {

	@Autowired
	public Go_Cart_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Cart_InfoMapper.class);
	}

	
}
