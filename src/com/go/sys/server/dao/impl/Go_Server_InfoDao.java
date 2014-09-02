package com.go.sys.server.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.sys.server.dao.IGo_Server_InfoDao;
import com.go.sys.server.mapper.IGo_Server_InfoMapper;
import com.go.sys.server.model.Go_Server_Info;
/**
 * 套餐服务相关信息数据层实现类
 * @author zhangjf
 * @create_time 2014-9-1 下午11:03:35
 */
@Repository
public class Go_Server_InfoDao extends Go_BaseDao<Go_Server_Info, Integer>
		implements IGo_Server_InfoDao {

	@Autowired
	public Go_Server_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		this.setMapperClass(IGo_Server_InfoMapper.class);
	}

	
}
