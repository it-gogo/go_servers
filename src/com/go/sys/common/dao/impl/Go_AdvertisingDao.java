package com.go.sys.common.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.common.dao.IGo_AdvertisingDao;
import com.go.sys.common.mapper.IGo_AdvertisingMapper;
import com.go.sys.common.model.Go_Advertising;

/**
 * 广告数据层实现类
 * @author chenhb
 */
@Repository
public class Go_AdvertisingDao extends Go_BaseDao<Go_Advertising, Integer> implements IGo_AdvertisingDao {
	
	@Autowired
	public Go_AdvertisingDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_AdvertisingMapper.class);
	}


}
