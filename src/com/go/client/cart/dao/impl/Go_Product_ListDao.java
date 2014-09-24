package com.go.client.cart.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.cart.dao.IGo_Product_ListDao;
import com.go.client.cart.mapper.IGo_Product_ListMapper;
import com.go.client.cart.model.Go_Product_List;
/**
 * 商品列表信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Product_ListDao extends Go_BaseDao<Go_Product_List, Integer>
		implements IGo_Product_ListDao {

	@Autowired
	public Go_Product_ListDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Product_ListMapper.class);
	}

	
}
