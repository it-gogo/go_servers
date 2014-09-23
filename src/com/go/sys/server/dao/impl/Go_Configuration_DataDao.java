package com.go.sys.server.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.server.dao.IGo_Configuration_DataDao;
import com.go.sys.server.mapper.IGo_Configuration_DataMapper;
import com.go.sys.server.model.Go_Configuration_Data;
/**
 * 可配置数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Configuration_DataDao extends Go_BaseDao<Go_Configuration_Data, Integer>
		implements IGo_Configuration_DataDao {

	@Autowired
	public Go_Configuration_DataDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Configuration_DataMapper.class);
	}

	
}
