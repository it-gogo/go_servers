package com.go.client.main.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.go.base.dao.impl.Go_BaseDao;
import com.go.client.main.dao.IGo_Login_InfoDao;
import com.go.sys.authority.model.Go_Department_Info;

/**
 * 服务器列表信息 数据层实现类
 * @author chenhb
 */
@Repository
public class Go_Login_InfoDao extends Go_BaseDao<Go_Department_Info, Integer> implements IGo_Login_InfoDao{

	@Autowired
	public Go_Login_InfoDao(SqlSessionFactory sqlSessionFactory) {
		super(sqlSessionFactory);
		// TODO Auto-generated constructor stub
	}

	
	
	
}
