package com.go.client.serverList.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.serverList.dao.IGo_ServerList_InfoDao;
import com.go.sys.authority.model.Go_Department_Info;

/**
 * 服务器列表信息 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_ServerList_InfoDao extends Go_BaseDao<Go_Department_Info, Integer> implements IGo_ServerList_InfoDao{

	@Autowired
	public Go_ServerList_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		// TODO Auto-generated constructor stub
	}

	
	
	
}
