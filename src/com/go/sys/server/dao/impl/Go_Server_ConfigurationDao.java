package com.go.sys.server.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.server.dao.IGo_Server_ConfigurationDao;
import com.go.sys.server.mapper.IGo_Server_ConfigurationMapper;
import com.go.sys.server.model.Go_Server_Configuration;
/**
 * 服务器跟可配置关联表数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Server_ConfigurationDao extends Go_BaseDao<Go_Server_Configuration, Integer>
		implements IGo_Server_ConfigurationDao {

	@Autowired
	public Go_Server_ConfigurationDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Server_ConfigurationMapper.class);
	}

	
}
