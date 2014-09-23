package com.go.sys.server.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.server.dao.IGo_Server_PriceDao;
import com.go.sys.server.mapper.IGo_Server_PriceMapper;
import com.go.sys.server.model.Go_Server_Price;
/**
 * 价格相关信息数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Server_PriceDao extends Go_BaseDao<Go_Server_Price, Integer>
		implements IGo_Server_PriceDao {

	@Autowired
	public Go_Server_PriceDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Server_PriceMapper.class);
	}

	
}
