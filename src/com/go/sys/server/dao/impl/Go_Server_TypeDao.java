package com.go.sys.server.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.server.dao.IGo_Server_TypeDao;
import com.go.sys.server.mapper.IGo_Server_TypeMapper;
import com.go.sys.server.model.Go_Server_Type;
/**
 * 服务器类型数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Server_TypeDao extends Go_BaseDao<Go_Server_Type, Integer>
		implements IGo_Server_TypeDao {

	@Autowired
	public Go_Server_TypeDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Server_TypeMapper.class);
	}

	
}
